import React from "react";
import { Outlet, Navigate } from "react-router-dom";
const useAuth = () => {
  const user = sessionStorage.getItem("user");
  if (user) {
    return true;
  }
  return false;
};
const PrivateRoute = () => {
  const auth = useAuth();
  return auth ? <Outlet /> : <Navigate to="/login"></Navigate>;
};
export default PrivateRoute;
