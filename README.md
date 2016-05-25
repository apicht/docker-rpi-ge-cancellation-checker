
Docker image containing ge-cancellation-checker compatible with the Raspberry Pi.

You must set your Global Entry and SMTP settings in config.json.

Further documentation for ge-cancellation-checker is available here: https://github.com/zeeMonkeez/ge-cancellation-checker

### Example: Create container, run a check
```bash
docker create --name=ge-cancellation-checker -v $(pwd)/config.json:/ge-cancellation-checker/config.json apicht/rpi-ge-cancellation-checker
docker run -ti ge-cancellation-checker
```

### Example: Run a check without creating a container
```bash
docker run -ti --rm -v $(pwd)/config.json:/ge-cancellation-checker/config.json apicht/rpi-ge-cancellation-checker
```

### Example: Schedule a check during waking hours (PST adjusted to UTC)
```bash
docker create --name=ge-cancellation-checker -v $(pwd)/config.json:/ge-cancellation-checker/config.json apicht/rpi-ge-cancellation-checker

crontab -e

30 15-23 * * * docker start ge-cancellation-checker >> /dev/null
30 0-6 * * * docker start ge-cancellation-checker >> /dev/null
```
