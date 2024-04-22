import { Route, Routes } from "react-router-dom";
import LoginPage from "../pages/login/Login";
import getToken from "../pages/login/loginServices/getToken";
import { useState } from "react";
import { useSelector } from "react-redux";
import Dashboard from "./DashboardRoute";

const Login = () => {
  const [loginStatus, setLoginStatus] = useState(true);
  const { activeSong } = useSelector((state) => state.player);
  console.log(loginStatus);
  const token = getToken();
  console.log(token);

  return (
    <>
      {!loginStatus && (
        <div className="px-6 pb-16 h-[calc(100vh-60px)] overflow-y-scroll hide-scrollbar flex xl:flex-row flex-col-reverse">
          <div className="flex-1 h-fit pb-40 ">
            <Routes>
              <Route path="/login" element={<LoginPage />} />
              {/* <Route path="/register" element={<TopArtists />} /> */}
            </Routes>
          </div>
        </div>
      )}
      {loginStatus && <Dashboard />}
    </>
  );
};

export default Login;
