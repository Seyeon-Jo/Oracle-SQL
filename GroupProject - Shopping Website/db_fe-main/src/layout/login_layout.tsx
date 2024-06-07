import NavLayout from "./nav_layout";

const Login_layout = () => {
  return (
    <div className="h-screen">
      <NavLayout />
      <div className="max-w-2xl w-full m-auto flex items-center">
        <form
          className="grid grid-rows-3 gap-4 w-full grid-cols-3"
          onSubmit={(e) => {
            e.preventDefault();
          }}
        >
          <div className="flex flex-col max-w-xs w-full row-start-2 col-start-2">
            <label className="text-sm font-light" htmlFor="email">
              Email
            </label>
            <input
              id="email"
              type="email"
              title="email"
              className="rounded border"
            />
          </div>
          <div className="flex flex-col max-w-xs w-full row-start-3 col-start-2">
            <label className="text-sm font-light" htmlFor="password">
              Pasword
            </label>
            <input
              id="password"
              type="password"
              title="password"
              className="rounded border"
            />
          </div>
          <div className="text-sm font-light">
            <div>
              <span>New Here? </span>
              <a href="/register" className="text-teal-800">
                {" "}
                Register first.
              </a>
            </div>
          </div>
          <button type="submit" className="row-start-4 col-start-2">
            Login
          </button>
        </form>
      </div>
    </div>
  );
};

export default Login_layout;
