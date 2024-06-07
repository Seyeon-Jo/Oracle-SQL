import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.tsx";
import "./index.css";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import Prod_layout from "./layout/prod_layout.tsx";
import Prods_layout from "./layout/prods_layout.tsx";
import Login_layout from "./layout/login_layout.tsx";
import Register_layout from "./layout/register_layout.tsx";
import Cart_layout from "./layout/cart_layout.tsx";
import Manage_layout from "./layout/manage_layout.tsx";
import Wishlist from "./layout/wish_list.tsx";

const router = createBrowserRouter([
  { path: "/", element: <App /> },
  { path: "/login", element: <Login_layout /> },
  { path: "/register", element: <Register_layout /> },
  { path: "/cart", element: <Cart_layout /> },
  { path: "/manage", element: <Manage_layout /> },
  { path: "/wishlist", element: <Wishlist /> },
  {
    path: "/prod/",
    element: <Prods_layout />,
  },
  {
    path: "/prod/:id",
    element: <Prod_layout />,
  },
]);

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
