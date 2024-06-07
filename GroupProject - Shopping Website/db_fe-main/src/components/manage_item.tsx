import { Popover } from "@headlessui/react";
import { useState } from "react";

const Manage_item = () => {
  const [image, setImage] = useState(null);
  const [name, setName] = useState(" ");
  const [desc, setDesc] = useState(" ");

  const handleImage = (event: any) => {
    const file = event.target.files[0];
    setImage(file);
  };

  return (
    <div className="w-full shadow p-4 rounded-lg">
      <div className="grid grid-cols-6 h-full  py-4 gap-2">
        <div>
          <label htmlFor="imginp">Upload Image</label>
          <input
            className="hidden"
            id="imginp"
            type="file"
            accept="image/*"
            onChange={handleImage}
          />
          {image && (
            <div>
              <h2>Preview:</h2>
              <img
                src={URL.createObjectURL(image)}
                alt="Selected"
                style={{ maxWidth: "100%", maxHeight: "200px" }}
              />
            </div>
          )}
        </div>
        <div className="col-span-4 flex flex-col gap-2 justify-between">
          <div className="flex flex-row items-center gap-4">
            <label htmlFor="title" className="text-sm">
              Name
            </label>
            <input
              id="title"
              className="rounded shadow-sm p-1 outline-none"
              title="title"
              placeholder="Title"
              type="text"
            />
          </div>
          <div className="flex flex-col gap-4">
            <label htmlFor="desc" className="text-sm">
              desciption
            </label>
            <textarea
              id="desc"
              className="rounded shadow-sm p-1 outline-none"
              title="desc"
              placeholder="description"
            />
          </div>
          <div className="flex flex-row items-center gap-4">
            <label htmlFor="price" className="text-sm">
              Price
            </label>
            <input
              id="price"
              className="rounded shadow-sm p-1 outline-none"
              title="price"
              placeholder="Price"
              type="number"
            />
          </div>
        </div>
        <div className="flex flex-col justify-between">
          <Popover className="relative flex justify-end">
            <Popover.Button>
              <span className="flex justify-end">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  strokeWidth={1.5}
                  stroke="currentColor"
                  className="w-6 h-6"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    d="M5 10l7-7m0 0l7 7m-7-7v18"
                  />
                </svg>
              </span>
            </Popover.Button>

            <Popover.Panel className="absolute z-10 -bottom-8">
              <div className="grid grid-cols-2 gap-2 text-sm">
                <button className="border rounded p-1 hover:bg-red-500 hover:text-white">
                  Update
                </button>
                <button className="border rounded p-1 hover:bg-teal-500 hover:text-white">
                  Add
                </button>
              </div>
            </Popover.Panel>
          </Popover>
          <Popover className="relative flex justify-end">
            <Popover.Button>
              <span className="flex justify-end">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  strokeWidth={1.5}
                  stroke="currentColor"
                  className="w-6 h-6"
                >
                  <path
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"
                  />
                </svg>
              </span>
            </Popover.Button>

            <Popover.Panel className="absolute z-10 -bottom-8">
              <div className="grid grid-cols-2 gap-2 text-sm">
                <button className="border rounded p-1 hover:bg-red-500 hover:text-white">
                  Yes
                </button>
                <button className="border rounded p-1 hover:bg-teal-500 hover:text-white">
                  No
                </button>
              </div>
            </Popover.Panel>
          </Popover>

          <input
            className="rounded border shadow-sm p-1"
            title="quant"
            placeholder="Quantity"
            type="number"
          />
        </div>
      </div>
    </div>
  );
};

export default Manage_item;
