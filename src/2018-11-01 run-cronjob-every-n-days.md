# Run a *NIX cron job each N days

There are many posts about this around the Internet, but I couldn't find any that explained how to run the job each N days **since job's last change**. 

Of course, for this approach to be useful, you will need to have granular cron job files in '/etc/cron.d'; which IMHO, it's a really good practice and eases its management.

Here's an example of how to run a garbage collection job each 3 days at 0:00 since last change:

- Content of _/etc/cron.d/garbage-collect_:

```
0 0 * * * root RUN_EACH_DAYS=3; [ $((  $(( $(date +%-j) - $(stat -c %Y /etc/cron.d/garbage-collect | date +%j) )) % 3 )) == $RUN_EACH_DAYS ] && do-some-stuff
```

If you ever happen to change the frequency or the time the script runs at, it will execute again *the same day* and 3 days after that day.

tags: cron job every days linux unix
