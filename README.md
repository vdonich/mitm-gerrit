# Scripts for PolyGerrit local development against prod using MitmProxy.

## Installation (OSX)

1. Install Docker from http://docker.com
2. Clone Gerrit repo from https://gerrit.googlesource.com/gerrit/
   ```
   cd
   git clone https://gerrit.googlesource.com/gerrit
   ```
3. Clone this repo
   - Also consider adding it to $PATH, or create symlinks for scripts.
   ```
   cd
   git clone https://github.com/vdonich/mitm-gerrit.git
   ```
4. Start the proxy and create a new proxied browser instance
   ```
   cd ~/gerrit
   ~/mitm-gerrit/mitm-serve-app-dev.sh
   ```
5. Install MITM certificates
   - Open http://mitm.it in the proxied browser window
   - Follow the instructions to install MITM certs

## Usage

### Add or replace a plugin for *.googlesource.com

1. Create a new proxied browser window and start mitmproxy via Docker:
   ```
   cd ~/gerrit
   ~/mitm-gerrit/mitm-plugins.sh ./path/to/plugin.html,./maybe/one/more.js
   ```
2. Open any *.googlesource.com domain in proxied window
3. plugin.html and more.js are served

### Serve uncompiled PolyGerrit

1. Create a new proxied browser window and start mitmproxy via Docker:
   ```
   cd ~/gerrit
   ~/mitm-gerrit/mitm-serve-app-dev.sh
   ```
2. Open any *.googlesource.com domain in proxied window
3. Instead of prod UI (gr-app.html, gr-app.js), local source files will be served
