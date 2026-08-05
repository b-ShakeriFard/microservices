author: Behrouz ShakeriFard
date: 2026 - Aug 5th
contact: bshakeri@torontomu.ca

I keep forgetting how to use git; it's true! So, I made this for myself :-D

<h3> WTF Am I Doing? </h3>

You have a repository on GitHub, and you want to push. Do this:

<b> Generate an SSH Key </b>
```bash
ssh-keygen -t ed25519 \
  -C "your-other-github-email@example.com" \
  -f ~/.ssh/id_ed25519_bshakerifard