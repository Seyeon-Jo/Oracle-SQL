import NavLayout from "./nav_layout";

const Register_layout = () => {
  return (
    <div className="h-screen">
      <NavLayout />
      <div className="max-w-2xl w-full m-auto flex items-center">
        <form
          className="grid grid-rows-6 gap-4 w-full grid-cols-3"
          onSubmit={(e) => {
            e.preventDefault();
          }}
        >
          <div className="flex flex-col max-w-xs w-full row-start-2 col-start-2">
            <label className="text-sm font-light" htmlFor="username">
              Username
            </label>
            <input
              id="username"
              type="text"
              title="username"
              className="rounded border"
            />
          </div>
          <div className="flex flex-col max-w-xs w-full row-start-3 col-start-2">
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
          <div className="flex flex-col max-w-xs w-full row-start-4 col-start-2">
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
          <div className="flex flex-col max-w-xs w-full row-start-5 col-start-2">
            <label className="text-sm font-light" htmlFor="confpassword">
              Confirm Password
            </label>
            <input
              id="confpassword"
              type="password"
              title="confpassword"
              className="rounded border"
            />
          </div>
          <div className="text-sm font-light">
            <div>
              <span>Already have an account? </span>
              <a href="/login" className="text-teal-800">
                {" "}
                Login
              </a>
            </div>
          </div>
          <button type="submit" className="row-start-6 col-start-2">
            Login
          </button>
        </form>
      </div>
    </div>
  );
};

export default Register_layout;
