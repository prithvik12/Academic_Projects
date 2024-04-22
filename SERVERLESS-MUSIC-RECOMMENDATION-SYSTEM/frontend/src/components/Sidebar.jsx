import React, { useState } from "react";
import { NavLink } from "react-router-dom";
import {
  HiOutlineHashtag,
  HiOutlineHome,
  HiOutlineMenu,
  HiOutlinePhotograph,
  HiOutlineUserGroup,
  HiOutlineLogout,
} from "react-icons/hi";
import { RiCloseLine } from "react-icons/ri";

import { logo } from "../assets";
import { links } from "../assets/constants";
import { Link } from "react-router-dom";
import resetUserSession from "../pages/login/loginServices/resetUserSession";

const NavLinks = () => {
  const logoutHandler = () => {
    resetUserSession();
  };

  return (
    <div className="mt-10">
      <div className="flex flex-col">
        <div className="flex flex-row justify-start items-center mb-6 text-sm font-medium text-gray-400 hover:text-cyan-400">
          <HiOutlineLogout className="w-6 h-6 mr-2" />
          <NavLink to="/login" onClick={() => handleClick && handleClick()}>
            Login
          </NavLink>
        </div>
        <div className="flex flex-row justify-start items-center mb-6 text-sm font-medium text-gray-400 hover:text-cyan-400">
          <HiOutlineHashtag className="w-6 h-6 mr-2" />
          <NavLink to="/register" onClick={() => handleClick && handleClick()}>
            Register
          </NavLink>
        </div>
        <div className="flex flex-row justify-start items-center mb-6 text-sm font-medium text-gray-400 hover:text-cyan-400">
          <HiOutlineHome className="w-6 h-6 mr-2" />
          <NavLink to="/discover" onClick={() => handleClick && handleClick()}>
            Discover
          </NavLink>
        </div>

        <div className="flex flex-row justify-start items-center mb-6 text-sm font-medium text-gray-400 hover:text-cyan-400">
          <HiOutlinePhotograph className="w-6 h-6 mr-2" />
          <NavLink
            to="/around-you"
            onClick={() => handleClick && handleClick()}
          >
            Around You
          </NavLink>
        </div>

        <div className="flex flex-row justify-start items-center mb-6 text-sm font-medium text-gray-400 hover:text-cyan-400">
          <HiOutlineUserGroup className="w-6 h-6 mr-2" />
          <NavLink
            to="/top-artists"
            onClick={() => handleClick && handleClick()}
          >
            Top Artists
          </NavLink>
        </div>

        <div className="flex flex-row justify-start items-center mb-6 text-sm font-medium text-gray-400 hover:text-cyan-400">
          <HiOutlineHashtag className="w-6 h-6 mr-2" />
          <NavLink
            to="/top-charts"
            onClick={() => handleClick && handleClick()}
          >
            Top Charts
          </NavLink>
        </div>

        <div className="flex flex-row justify-start items-center mb-6 text-sm font-medium text-gray-400 hover:text-cyan-400">
          <HiOutlineLogout className="w-6 h-6 mr-2" />
          <NavLink to="/login" onClick={() => logoutHandler()}>
            Logout
          </NavLink>
        </div>
      </div>
    </div>
  );
};

const Sidebar = () => {
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  return (
    <>
      <div className="md:flex hidden flex-col w-[240px] py-10 p-4 bg-[#191624]">
        <Link to="/">
          <img
            src="https://poc-assignment-1-data-source.s3.us-east-1.amazonaws.com/ALMUSIQAA.jpg?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIEi0Z78GMSNmt09wi7E85%2BSRvxK4BUo7UrzD%2BX%2FoKLpjAiANeCYPRf%2B4EQUcxbOhNbrC7HGg%2B%2FJpkl%2BHsXQk%2FKJaOyrkAggcEAEaDDI1Mjk2MDQ5MTE1NiIMdatVdA2vQDXHuw1bKsECzX%2FivqF4QhzfCIfk2kjpudaLGEsiGaUSzv5c5zTgOiJUyYIktx4W5%2Fo8KW8f5OiOj3seYmL%2BR2LGW3GN5KW%2Fq2yMfdTawHsYI0LLtg1pBISyzwA0wP2We1xRUUB6Sc7q9EbW%2FjCRusZzJyLxNk80H7FfNSdunwByWeSHEUfvmC6S8RQIy6%2BNLyfqTL5ggoBsUPH7KC3psAVrX7zFfmr%2BfXMltojVb6NJhH3oAG4Sy08Lj2Nx8v6WAnq3l76tqhS4%2F2uLxopsQNLUUsFOB6j3w%2Fj5tqedzgb%2BPwVf0A0gPsQ1BOgElDsm2oC0x%2BUUPuTYnlMT%2Fbb%2FA%2B%2BHSZwfDS8y1JUXn8KIpzqOB6tweXI6VyCzAGs7xZ2L3xJJ7lygiEAImwSZvQ%2F8%2BOThQ068UMkQh%2FF6ZJmjrPpIBhf2imZUnoZmMN3nvZwGOrQCewECO%2BQZZyNM2%2FwePAyCX1ejhpxvcJnGdlDl6k87kMBa9gj2rcA8MVurA3pvqsN0iiUEob17uw5V9ZhJEljwPoWwKJL%2BjhdXMq%2BxHXaDtSPkFRCWMsB00Gqa8NGslQlW%2FQOxqEHcb5eD01Jl%2F2b7QLrJAt0fN6eVXLvc5hFhascisQ37%2BqpDReVKZqq9vA%2BrTbmFx%2FKxTyrMkZDUpibBDFlYfIPB29SKRlCor8rNPKzqMD%2BhBCla3%2FZiffMiaBO%2Fxh1VqRVtr4MW5RD2521Qcn3GiaQfzx0zzW68Og5%2FgB95O6PXwLq9jDkaEXeI%2BX9SbWTfslp7mm%2FF1VdRDZOcPs5wNbvuR4S4yGg9cAGZRJG0xCTnhyBBQvg49MXPLJ41BUdz%2BeZ0xpB8iQVgo6F6mycZ58o%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221206T184803Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIATVZM6Y2KJOWF73ET%2F20221206%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=e1996916afd500516efb673eae835ed3fde4fe97ce58613b0b9675195e00e271"
            alt="logo"
            className="w-full h-14 object-contain"
          />
        </Link>
        <NavLinks />
      </div>
      <div className="absolute md:hidden block top-6 right-3 z-50">
        {mobileMenuOpen ? (
          <RiCloseLine
            className="w-6 h-6 text-white mr-2"
            onClick={() => setMobileMenuOpen(false)}
          />
        ) : (
          <HiOutlineMenu
            className="w-6 h-6 text-white mr-2 z-50"
            onClick={() => setMobileMenuOpen(true)}
          />
        )}
      </div>
      <div
        className={`absolute top-0 h-screen w-2/3 bg-gradient-to-tl from-white/10 to-[#483d8b] backdrop-blur-lg z-50 p-6 md:hidden smooth-transition ${
          mobileMenuOpen ? "left-0" : "left-[100%]"
        }`}
      >
        <img src={logo} alt="logo" className="w-full h-14 object-contain" />
        <NavLinks handleClick={() => setMobileMenuOpen(false)} />
      </div>
    </>
  );
};

export default Sidebar;
