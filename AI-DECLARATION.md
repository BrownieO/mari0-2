---
version: "0.1.2"
level: copilot
components:
  .wiki.git: assist
  class/Actor.lua: copilot
  components/smb3/animation.lua: copilot
  lib/Gui3/Element.lua: copilot
---

This format is based on [AI-DECLARATION.md](https://ai-declaration.md/en/0.1.2).

## Notes

- Zo Computer and the free tier of Github Copilot was used
- Copilot provided the first insights into the codebase
- Copilot generated the actor destruction function
- Copilot fixed a crash when the somersault animation of the player did not exist
- Zo Computer AI fixed a stale-render bug for hidden children on Gui3
- Zo Computer AI reviewed the Copilot-attributed actor and somersault changes; repeated actor destruction now returns without repeating cleanup
- All output was reviewed by a human
- All other assets are human-made