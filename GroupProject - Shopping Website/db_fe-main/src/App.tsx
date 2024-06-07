import NavLayout from "./layout/nav_layout";

function App() {
  return (
    <div className="h-screen flex flex-col">
      <NavLayout />
      <div className="flex-1 flex justify-center items-center">
        <a href="/prod" className="hover:underline">
          SHOP NOW
        </a>
      </div>
    </div>
  );
}

export default App;
