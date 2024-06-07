const Prod_item = () => {
  return (
    <div className="w-full min-h-[16rem] max-h-[16rem] h-full grid grid-rows-6 hover:brightness-95 cursor-pointer">
      <div className="row-span-5 rounded  border-2 border-gray-100">img</div>
      <div className="flex flex-col font-light text-sm">
        <div className="flex flex-row justify-between">
          <div className="font-medium">name</div>
          <div>11.11</div>
        </div>
        <div>color</div>
      </div>
    </div>
  );
};

export default Prod_item;
