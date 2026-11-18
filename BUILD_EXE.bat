@echo off
title Compilatore Easy11.exe v4.0
cd /d "%~dp0"

set "AUTHOR=Tom Ardi"

echo Generazione icona e compilazione di Easy11.exe v4.0 firmato da %AUTHOR%...

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Add-Type -AssemblyName System.Drawing; ^
$bmp = New-Object System.Drawing.Bitmap(64,64); ^
$g = [System.Drawing.Graphics]::FromImage($bmp); ^
$g.SmoothingMode = 'AntiAlias'; ^
$g.Clear([System.Drawing.Color]::FromArgb(2, 132, 199)); ^
$font = New-Object System.Drawing.Font('Segoe UI', 24, [System.Drawing.FontStyle]::Bold); ^
$g.DrawString('11', $font, [System.Drawing.Brushes]::White, 8, 10); ^
$icon = [System.Drawing.Icon]::FromHandle($bmp.GetHicon()); ^
$fs = New-Object System.IO.FileStream('easy11.ico', 'Create'); ^
$icon.Save($fs); $fs.Close(); ^
$psBytes = [System.IO.File]::ReadAllBytes('src\easy11.ps1'); ^
$b64 = [Convert]::ToBase64String($psBytes); ^
$csCode = 'using System; using System.IO; using System.Diagnostics; using System.Reflection; ' + ^
'[assembly: AssemblyTitle(\"Easy11\")] ' + ^
'[assembly: AssemblyDescription(\"Easy11 Apex Edition - Ottimizzatore Universale per Windows 11\")] ' + ^
'[assembly: AssemblyCompany(\"%AUTHOR%\")] ' + ^
'[assembly: AssemblyProduct(\"Easy11 v4.0 Apex Edition\")] ' + ^
'[assembly: AssemblyCopyright(\"Copyright (c) 2026 %AUTHOR%\")] ' + ^
'[assembly: AssemblyVersion(\"4.0.0.0\")] ' + ^
'class Program { static void Main() { ' + ^
'string tmp = Path.Combine(Path.GetTempPath(), \"Easy11_\" + Guid.NewGuid().ToString(\"N\") + \".ps1\"); ' + ^
'File.WriteAllBytes(tmp, Convert.FromBase64String(\"' + $b64 + '\")); ' + ^
'var psi = new ProcessStartInfo(\"powershell.exe\", \"-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File \\\"\" + tmp + \"\\\"\"); ' + ^
'psi.Verb = \"runas\"; psi.UseShellExecute = true; ' + ^
'try { var p = Process.Start(psi); if (p != null) p.WaitForExit(); } catch {} finally { try { File.Delete(tmp); } catch {} } } }'; ^
$cp = New-Object System.CodeDom.Compiler.CompilerParameters; ^
$cp.GenerateExecutable = $true; ^
$cp.OutputAssembly = 'Easy11.exe'; ^
$cp.CompilerOptions = '/target:winexe /win32icon:easy11.ico'; ^
$provider = New-Object Microsoft.CSharp.CSharpCodeProvider; ^
$provider.CompileAssemblyFromSource($cp, $csCode) | Out-Null; ^
Remove-Item 'easy11.ico' -ErrorAction SilentlyContinue;"

if exist "Easy11.exe" (
    echo.
    echo [SUCCESSO] Easy11.exe v4.0 creato con icona e firma di %AUTHOR%!
) else (
    echo [ERRORE] Compilazione fallita.
)
pause