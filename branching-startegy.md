# Branching Strategy: Short-Lived Feature Branches

This repository follows a **short-lived feature branch** workflow designed to keep `main` stable, reduce merge conflicts, and enable fast, continuous delivery.

## Overview

- `main` is the **single long-living branch**
- All work is done in **short-lived feature branches**
- Feature branches are merged back into `main` quickly and then deleted

