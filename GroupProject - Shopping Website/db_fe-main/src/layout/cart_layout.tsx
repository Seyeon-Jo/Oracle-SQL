import NavLayout from "./nav_layout";
import Checkout_item from "../components/checkout_item";

const Cart_layout = () => {
  return (
    <div>
      <NavLayout />
      <div className="max-w-2xl w-full m-auto grid grid-rows-6 gap-2">
        <h1> Order Summary</h1>
        <div className="row-span-5 border rounded-md shadow-sm p-6">
          <div>
            <Checkout_item />
          </div>
          <hr />
          <div className="flex flex-col gap-2">
            <div className="flex justify-between">
              <span>Subtotal</span>
              <span>93.3</span>
            </div>
            <div className="flex justify-between">
              <span>Shipping</span>
              <span>33</span>
            </div>
            <div className="flex justify-between">
              <span>Taxes</span>
              <span>33</span>
            </div>
            <hr />
            <div className="flex justify-between text-xl py-4">
              <span>Total</span>
              <span>33</span>
            </div>
          </div>
          <hr />
          <div className="flex items-center p-2">
            <button className="text-white bg-teal-500 p-3 w-full rounded-md hover:brightness-95">
              Check out
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Cart_layout;
