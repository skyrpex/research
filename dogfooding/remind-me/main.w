bring cloud;

let EMPTY_JSON = Json {empty: "empty"};

resource Utils {
    extern "./utils.js" static read_file(file: str, url: str): str;
    init(){}
}

let websiteBucket = new cloud.Bucket(public: true);
let reminderApi = new cloud.Api();

websiteBucket.add_object("index.html", Utils.read_file("./index.html", reminderApi.url));

reminderApi.post("/add", inflight (req: cloud.ApiRequest): cloud.ApiResponse => {
    let data = req.body ?? EMPTY_JSON;
    let email = str.from_json(data.get("email"));
    let reminder = str.from_json(data.get("reminder"));
    return cloud.ApiResponse {
        status: 200,
        body: req
      };
  });