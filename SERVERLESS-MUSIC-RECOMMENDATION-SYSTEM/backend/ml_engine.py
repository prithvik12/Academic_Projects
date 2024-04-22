import json
import os
import sys
import boto3

#from botocore.session import Session
#from botocore.config import Config
#from requests.exceptions import ReadTimeout

from collections import defaultdict

runtime = boto3.client('runtime.sagemaker')
#BUCKET = os.environ['BUCKET']
# s3_client = boto3.client('s3')
print('Setting up S3 connection...')
print('Setting up S3 connection...')
#bucket = s3_client.Bucket(BUCKET)

sys.path.append(os.path.abspath("/mnt/efs/lib"))
import numpy as np
import pandas as pd 
from sklearn.cluster import KMeans
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline
from sklearn.manifold import TSNE
from sklearn.decomposition import PCA
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
from collections import defaultdict
from collections import defaultdict
from sklearn.metrics import euclidean_distances
from scipy.spatial.distance import cdist
import difflib
import spotipy.util as util
#s = Session()
#c = s.create_client('s3', config=Config(connect_timeout=5, read_timeout=60, retries={'max_attempts': 2}))
from botocore.vendored import requests 
def lambda_handler(event, context):
    #jobid = event.get('jobID')
    #url = '
    #res = requests.get(url)
    #js_res = res.json()
    #return js_res['state']
    data=pd.read_csv(os.path.abspath("/mnt/efs/dataset/data_spotify.csv"))
    # arr = numpy.array([1, 2, 3, 4, 5])
    # print(os.listdir("/mnt/efs/dataset"))
    
    data_by_genres=pd.read_csv(os.path.abspath("/mnt/efs/dataset/data_by_genres.csv"))
    # print(data_by_genres)
    # print(data)
  
    
    cluster_pipeline = Pipeline([('scaler', StandardScaler()), ('kmeans', KMeans(n_clusters=10))])
    X = data_by_genres.select_dtypes(np.number)
    cluster_pipeline.fit(X)
    data_by_genres['cluster'] = cluster_pipeline.predict(X)
    
    
    tsne_pipeline = Pipeline([('scaler', StandardScaler()), ('tsne', TSNE(n_components=2, verbose=1))])
    genre_embedding = tsne_pipeline.fit_transform(X)
    projection = pd.DataFrame(columns=['x', 'y'], data=genre_embedding)
    projection['genres'] = data_by_genres['genres']
    projection['cluster'] = data_by_genres['cluster']
    
    #fig = px.scatter(projection, x='x', y='y', color='cluster', hover_data=['x', 'y', 'genres'])
    #fig.show()

    song_cluster_pipeline = Pipeline([('scaler', StandardScaler()), 
                                  ('kmeans', KMeans(n_clusters=20, 
                                   verbose=False))
                                 ], verbose=False)

    X = data.select_dtypes(np.number)
    number_cols = list(X.columns)
    song_cluster_pipeline.fit(X)
    song_cluster_labels = song_cluster_pipeline.predict(X)
    data['cluster_label'] = song_cluster_labels
    
    pca_pipeline = Pipeline([('scaler', StandardScaler()), ('PCA', PCA(n_components=2))])
    song_embedding = pca_pipeline.fit_transform(X)
    projection = pd.DataFrame(columns=['x', 'y'], data=song_embedding)
    projection['title'] = data['name']
    projection['cluster'] = data['cluster_label']

    #fig = px.scatter(projection, x='x', y='y', color='cluster', hover_data=['x', 'y', 'title'])
    #fig.show()
    
    #cid= '23f451b1f60744318ec241a620a132ce'
    #client_secret = 'e34dc4f5140b49d882beed582dd22b02'
    #scope='user-library-read'
    cid =  '23f451b1f60744318ec241a620a132ce'
    secret ='e34dc4f5140b49d882beed582dd22b02'
    #scope = 'user-library-read'
    redirect_uri='https://yyvf2u5q0h.execute-api.us-east-1.amazonaws.com/efs-prod-datacsv'
    client_credentials_manager = SpotifyClientCredentials(cid, secret,redirect_uri)
    #token = spotipy.prompt_for_user_token(scope,cid,secret,SPOTIPY_REDIRECT_URI)
    sp = spotipy.Spotify(client_credentials_manager)
    
    #sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)
    #url=event["redirect_uri"] 
    #return json.dumps(url)
    #token = util.prompt_for_user_token(
        #scope,
        #client_id= cid, 
        #client_secret=secret,
        #redirect_uri='https://yyvf2u5q0h.execute-api.us-east-1.amazonaws.com/efs-prod-datacsv'
        #)
    #sp = spotipy.Spotify(auth=token)
    #sp.current_user()
# https://yyvf2u5q0h.execute-api.us-east-1.amazonaws.com/efs-prod-datacsv
    def find_song(name, year):
        song_data = defaultdict()
        #try:
        results = sp.search(q= 'track: {} year: {}'.format(name,year), limit=1)
        print("::::"+results)
        #except ReadTimeout:
        if results['tracks']['items'] == []:
            return None
    
        results = results['tracks']['items'][0]
        track_id = results['id']
        audio_features = sp.audio_features(track_id)[0]
        song_data['name'] = [name]
        song_data['year'] = [year]
        song_data['explicit'] = [int(results['explicit'])]
        song_data['duration_ms'] = [results['duration_ms']]
        song_data['popularity'] = [results['popularity']]

        for key, value in audio_features.items():
            song_data[key] = value

        return pd.DataFrame(song_data)
        
    number_cols = ['valence', 'year', 'acousticness', 'danceability', 'duration_ms', 'energy', 'explicit',
                         'instrumentalness', 'key', 'liveness', 'loudness', 'mode', 'popularity', 'speechiness', 'tempo']
    def get_song_data(song, data):
        try:
            song_data = data[(data['name'] == song['name']) 
                                & (data['year'] == song['year'])].iloc[0]
            return song_data
            print("::::"+song_data)
        except IndexError:
            return find_song(song['name'], song['year'])
                
    def flatten_dict_list(dict_list):
        
    
        flattened_dict = defaultdict()
        for key in dict_list[0].keys():
            flattened_dict[key] = []
    
        for dictionary in dict_list:
            for key, value in dictionary.items():
                    flattened_dict[key].append(value)
            
        return flattened_dict
        

    def get_mean_vector(song_list, data):
        print("...." + str(song_list))
    
        song_vectors = []
    
        for song in song_list:
            song_data = get_song_data(song, data)
            if song_data is None:
                print('Warning: {} does not exist in Spotify or in database'.format(song['name']))
                continue
            song_vector = song_data[number_cols].values
            song_vectors.append(song_vector)  
    
        song_matrix = np.array(list(song_vectors))
        return np.mean(song_matrix, axis=0)

    def recommend_songs(song_list, data, n_songs=10):
    
        metadata_cols = ['name', 'year']
        
        song_dict = flatten_dict_list(song_list)
        print(song_dict)
        
    
        song_center = get_mean_vector(song_list, data)
        scaler = song_cluster_pipeline.steps[0][1]
        scaled_data = scaler.transform(data[number_cols])
        scaled_song_center = scaler.transform(song_center.reshape(1, -1))
        distances = cdist(scaled_song_center, scaled_data, 'cosine')
        index = list(np.argsort(distances)[:, :n_songs][0])
    
        rec_songs = data.iloc[index]
        rec_songs = rec_songs[~rec_songs['name'].isin(song_dict['name'])]
        return rec_songs[metadata_cols].to_dict(orient='records')
        
        

    #print(recommend_songs(song_list, data, n_songs=10))
    print(recommend_songs([{'name': 'Come As You Are', 'year':1991}, {'name': 'Smells Like Teen Spirit', 'year': 1991}, {'name': 'Lithium', 'year': 1992},{'name': 'All Apologies', 'year': 1993}, {'name': 'Stay Away', 'year': 1993}],  data))
    #return json.dumps(url)
    