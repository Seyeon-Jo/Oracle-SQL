import NavLayout from "./nav_layout";
import Prod_item from "../components/prod_item";

const Wishlist = () => {
  return (
    <div>
      <NavLayout />
      <div className="max-w-2xl w-full m-auto grid grid-cols-2 lg:grid-cols-4 p-2 gap-2">
        <Prod_item />
        <Prod_item />
        <Prod_item />
        <Prod_item />
      </div>
    </div>
  );
};

export default Wishlist;
