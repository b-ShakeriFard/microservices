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