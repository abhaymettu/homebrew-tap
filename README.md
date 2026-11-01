# homebrew-tap

Homebrew casks for apps by [@abhaymettu](https://github.com/abhaymettu).

```sh
brew install --cask abhaymettu/tap/perch
```

| Cask | What it is |
|---|---|
| [`perch`](Casks/perch.rb) | [Perch](https://github.com/abhaymettu/perch): everything running on your Mac in one menu bar panel, from Claude Code sessions and dev servers to usage limits |

Perch is ad-hoc signed and not notarized yet. The cask clears the quarantine flag after install so
macOS will open it; read the [cask](Casks/perch.rb) before installing if you want to see exactly
what it runs.
