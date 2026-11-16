@echo off
chcp 65001 >nul
rem 1) Launch via `uv run`: uv puts .venv\Scripts on PATH, which the WebUI
rem    needs to spawn `llamafactory-cli` as a bare command (runner.py Popen,
rem    otherwise Start raises WinError 2). Re-sync is safe: pyproject pins
rem    torch to the cu128 index and uv.lock locks 2.11.0+cu128.
rem 2) Point HF cache to drive E: the default C: cache is denied inside
rem    sandboxed processes (WinError 5).
rem NOTE: keep this file ASCII-only. UTF-8 comments + chcp 65001 make cmd
rem misread line offsets and execute comment fragments as commands.
set HF_HOME=E:\huggingface_cache
set HF_DATASETS_CACHE=E:\huggingface_cache\datasets
set HF_HUB_OFFLINE=1
set PYTHONIOENCODING=utf-8
uv run llamafactory-cli webui
pause
