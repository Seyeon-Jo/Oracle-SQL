type Prop = {
  searchRef: React.RefObject<HTMLInputElement>;
  onchangehandler: React.ChangeEventHandler<HTMLInputElement> | undefined;
};

const Searchbar = ({ searchRef, onchangehandler }: Prop) => {
  return (
    <div>
      <input
        onChange={onchangehandler}
        ref={searchRef}
        className="placeholder:italic w-full rounded shadow border-2 outline-none p-2"
        title="search"
        placeholder="Search by Name"
      />
    </div>
  );
};

export default Searchbar;
