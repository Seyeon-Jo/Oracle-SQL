import NavLayout from "./nav_layout";
import { useParams } from "react-router-dom";

const Prod_layout = () => {
  const { id: prod_id } = useParams();

  return (
    <div>
      <NavLayout />
      <div className="max-w-2xl w-full m-auto grid grid-cols-3 gap-2">
        <div className="col-span-1">img</div>
        <div className="col-span-2 grid grid-rows-6">
          <div className="row-start-2">
            <div className="font-bold text-xl">item name</div>
            <div className="font-light italic text-base">brand name</div>
            <div className="text-3xl font-light">price</div>
            <div>rating</div>
            <div>
              <button className="hover:underline text-teal-600">
                Add to wishlist
              </button>
            </div>
          </div>
          <div className="row-start-3">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt
            corporis minima similique error cupiditate voluptatibus molestiae
            vero aspernatur minus labore, dolor ipsa quae odit facilis! Culpa,
            veritatis porro. Distinctio, earum.
          </div>
          <div className="w-full grid grid-cols-3 row-start-4">
            <div className="col-span-2 flex justify-center items-center">
              <button className="bg-teal-600 text-white p-2 rounded-md hover:bg-teal-700 w-full">
                Add to Cart
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Prod_layout;
