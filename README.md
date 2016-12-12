# Neverwing Academy

A cheating tool for the popular Messenger game, Everwing Academy.

### Requirements

You need to have `git` and `ruby` installed on your computer.

### Setup

##### Find your login URL

1. Open Messenger in your browser.

2. Open Chrome developer tools in the same tab.

3. Select the 'Network' tab.

4. Start Everwing in the same tab.

5. Order the network results by request type.

6. Select the first (and only) FETCH request.

7. Save the Request URL. It starts like this: `https://stormcloud-146919.appspot.com/auth/login/?...`

##### Clone this repository 

Run the following commands if you're on MacOS or some variation of Linux:

```
git clone git@github.com:thepeiggy/neverwing
cd neverwing
```

##### Add your login URL

1. Use your favorite text editor and open up `run.rb`.

2. Replace the login URL with your login URL.

3. Run `ruby run.rb` in the project folder.

### Enjoy!
