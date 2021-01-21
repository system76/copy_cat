import Config

config =
  "CONFIG"
  |> System.fetch_env!()
  |> Jason.decode!()

config :copy_cat,
  producer:
    {BroadwaySQS.Producer,
     queue_url: config["SQS_URL"],
     config: [
       access_key_id: config["AWS_ACCESS_KEY_ID"],
       secret_access_key: config["AWS_SECRET_ACCESS_KEY"],
       region: config["AWS_REGION"]
     ]}

config :appsignal, :config, push_api_key: config["APPSIGNAL_KEY"]
