Make sure to put in api key for temporal:

```
firebase functions:config:set temporal.key="SAMPLE-API-KEY" temporal.url="https://temporal.dev.gaiaplant.app"
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
firebase functions:config:get > .runtimeconfig.json
```
