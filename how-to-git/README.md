author: Behrouz ShakeriFard <br>
date: 2026 - Aug 5th <br>
contact: bshakeri@torontomu.ca <br>

I keep forgetting how to use git; it's true! <br>
 So, I made this for myself :-D

<h3> WTF Am I Doing? </h3>

You have a repository on GitHub, and you want to push. Do this:

<ol>
<li> <b> Generate an SSH Key </b> </li>

```bash
ssh-keygen -t ed25519 \
  -C "your-other-github-email@example.com" \
  -f ~/.ssh/id_ed25519_bshakerifard
```

this would generate two keys - one private and one public. Next, copy it:

<li> <b> Copy it to your Git account: </b></li>

```bash
cat ~/.ssh/id_ed25519_bshakerifard.pub
```

<b> Settings > SSH and GPG keys > New SSH key </b>

<li> Test your connection </li>

Marvelous!

```bash
ssh -T git@github-b-shakerifard
```

Now you should receive a message indicating that authentication has been successful. 

<hr>

Next, set the url:

```bash
git remote set-url origin git@github-b-shakerifard:b-shakerifard/microservices.git
```

and verify 

```bash
git config --get remote.origin.url
```

and verify

```bash
git remote -v
```
</ol>

<hr>

<h3> Navigate to the folder where $h!t is going down! </h3>

Here, you do some simple things.

```bash
git clone
```

will download the repository.

<b> In case repository does not exist. </b>

```bash
git init 
git add .
git commit -m "Have a message ready for you update."
git branch -M main
git remote add origin git@github.com:b-shakerifard/REPOSITORY-NAME.git
git push -u origin main
```

If you can't do this, you should close your laptop and serious contemplate your life's decisions :-D

Joking... :-D

If the repository already exists, consider this:

```bash
git remote set-url origin <NEW URL>
```

Double check:

```bash
git remote -v
```

Good bye :-D