import React from "react";
import { Outlet, Navigate } from "react-router-dom";

const useAuth = () => {
  const user = sessionStorage.getItem("user");
  console.log(user);
  if (user) {
    return true;
  }
  return false;
};

const PublicRoute = (props) => {
  const auth = useAuth();
  return !auth ? <Outlet /> : <Navigate to="/dashboard" />;
};
export default PublicRoute;
