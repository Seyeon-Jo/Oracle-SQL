import { useRef } from "react";
import Searchbar from "../components/searchbar";
import NavLayout from "./nav_layout";
import Manage_item from "../components/manage_item";

const Manage_layout = () => {
  const searchRef = useRef<HTMLInputElement>(null);

  const searchHandler:
    | React.ChangeEventHandler<HTMLInputElement>
    | undefined = () => {
    const val = searchRef.current?.value;
  };
  return (
    <div>
      <NavLayout />
      <div className="max-w-2xl w-full m-auto">
        <Searchbar onchangehandler={searchHandler} searchRef={searchRef} />
        <div className="p-2">
          <Manage_item />
        </div>
      </div>
    </div>
  );
};

export default Manage_layout;
