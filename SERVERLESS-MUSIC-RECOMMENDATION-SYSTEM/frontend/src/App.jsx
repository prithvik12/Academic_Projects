import { Route, Routes } from "react-router-dom";
import LoginPage from "../src/pages/login/Login";
import getToken from "../src/pages/login/loginServices/getToken";
import { useState, useEffect } from "react";
import Dashboard from "../src/pages/DashboardRoute";
import PrivateRoute from "../src/pages/login/routes/PrivateRoute";
import PublicRoute from "../src/pages/login/routes/PublicRoute";
import Register from "./pages/login/Register";
import { useSelector } from "react-redux";

import { Searchbar, Sidebar, MusicPlayer, TopPlay } from "../src/components";
import {
  ArtistDetails,
  TopArtists,
  AroundYou,
  Discover,
  Search,
  SongDetails,
  TopCharts,
} from "../src/pages";

const App = () => {
  const [loginStatus, setLoginStatus] = useState(false);
  const [token, getToken] = useState(sessionStorage.getItem("user"));

  useEffect(() => {
    const useAuth = () => {
      const user = sessionStorage.getItem("user");
      console.log(user);
      if (user) {
        setLoginStatus(true);
      }
      setLoginStatus(false);
    };
  }, []);
  const { activeSong } = useSelector((state) => state.player);
  return (
    <div className="relative flex ">
      <Sidebar />
      <div className="flex-1 flex flex-col bg-gradient-to-br from-black to-[#121286]">
        <Searchbar />

        <div className="px-6 pb-16 h-[calc(100vh-60px)] overflow-y-scroll hide-scrollbar flex xl:flex-row flex-col-reverse">
          <div className="flex-1 h-fit pb-40 ">
            <Routes>
              <Route path="/register" element={<Register />} />
              <Route path="login" element={<PublicRoute />}>
                <Route path="/login" element={<LoginPage />} />
              </Route>
              <Route path="/" element={<PrivateRoute />}>
                <Route path="/discover" element={<Discover />} />
                <Route path="/top-artists" element={<TopArtists />} />
                <Route path="/top-charts" element={<TopCharts />} />
                <Route path="/around-you" element={<AroundYou />} />
                <Route path="/artists/:id" element={<ArtistDetails />} />
                <Route path="/songs/:songid" element={<SongDetails />} />
                <Route path="/search/:searchTerm" element={<Search />} />
              </Route>
            </Routes>
          </div>
          {/* sticky is a header */}
          <div className="xl:sticky relative top-0  h-fit ">
            <TopPlay />
          </div>
        </div>
      </div>

      {activeSong?.title && (
        <div className="absolute sm:h-[93px] h-[140px] bottom-0 left-0 right-0 flex animate-slideup bg-gradient-to-br from-white/10 to-[#2a2a80] backdrop-blur-lg rounded-t-3xl z-10">
          <MusicPlayer />
        </div>
      )}
    </div>

    //   <Routes>
    //     <Route path="/register" element={<Register />} />
    //     <Route path="login" element={<PublicRoute />}>
    //       <Route path="/login" element={<LoginPage />} />
    //     </Route>
    //     <Route path="dashboard" element={<PrivateRoute />}>
    //       <Route path="/dashboard" element={<Dashboard />} />
    //     </Route>
    //   </Routes>
  );
};

export default App;
