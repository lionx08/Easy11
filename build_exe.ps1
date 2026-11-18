$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root

$author = "Tom Ardi"
$srcFile = Join-Path $root "src\easy11.ps1"
$icoFile = Join-Path $root "easy11.ico"
$exeFile = Join-Path $root "Easy11.exe"

if (-not (Test-Path $srcFile)) {
    Write-Host "[ERRORE] File src\easy11.ps1 non trovato!" -ForegroundColor Red
    exit 1
}

Write-Host "1/3 Generazione icona..." -ForegroundColor Cyan
Add-Type -AssemblyName System.Drawing
$bmp = New-Object System.Drawing.Bitmap(64, 64)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = 'AntiAlias'
$g.Clear([System.Drawing.Color]::FromArgb(2, 132, 199))
$font = New-Object System.Drawing.Font('Segoe UI', 24, [System.Drawing.FontStyle]::Bold)
$g.DrawString('11', $font, [System.Drawing.Brushes]::White, 8, 10)
$icon = [System.Drawing.Icon]::FromHandle($bmp.GetHicon())
$fs = New-Object System.IO.FileStream($icoFile, 'Create')
$icon.Save($fs)
$fs.Close()
$g.Dispose()
$bmp.Dispose()

Write-Host "2/3 Codifica script e preparazione sorgente C#..." -ForegroundColor Cyan
$psText = [System.IO.File]::ReadAllText($srcFile, [System.Text.Encoding]::UTF8)
$b64 = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($psText))

$csCode = @"
using System;
using System.IO;
using System.Text;
using System.Diagnostics;
using System.Reflection;
using System.Windows.Forms;

[assembly: AssemblyTitle("Easy11")]
[assembly: AssemblyDescription("Easy11 Apex Edition - Ottimizzatore Universale per Windows 11")]
[assembly: AssemblyCompany("$author")]
[assembly: AssemblyProduct("Easy11 v4.0 Apex Edition")]
[assembly: AssemblyCopyright("Copyright (c) 2026 $author")]
[assembly: AssemblyVersion("4.0.0.0")]

class Program {
    [STAThread]
    static void Main() {
        string tmp = Path.Combine(Path.GetTempPath(), "Easy11_" + Guid.NewGuid().ToString("N") + ".ps1");
        try {
            string script = Encoding.UTF8.GetString(Convert.FromBase64String("$b64"));
            File.WriteAllText(tmp, script, new UTF8Encoding(true));
            var psi = new ProcessStartInfo("powershell.exe", "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File \"" + tmp + "\"");
            psi.Verb = "runas";
            psi.UseShellExecute = true;
            var p = Process.Start(psi);
            if (p != null) p.WaitForExit();
        } catch (Exception ex) {
            MessageBox.Show("Errore avvio Easy11: " + ex.Message, "Easy11", MessageBoxButtons.OK, MessageBoxIcon.Error);
        } finally {
            try { if (File.Exists(tmp)) File.Delete(tmp); } catch {}
        }
    }
}
"@

Write-Host "3/3 Compilazione Easy11.exe..." -ForegroundColor Cyan
$cp = New-Object System.CodeDom.Compiler.CompilerParameters
$cp.GenerateExecutable = $true
$cp.OutputAssembly = $exeFile
$cp.ReferencedAssemblies.Add("System.dll") | Out-Null
$cp.ReferencedAssemblies.Add("System.Windows.Forms.dll") | Out-Null
$cp.CompilerOptions = "/target:winexe /win32icon:`"$icoFile`""

$provider = New-Object Microsoft.CSharp.CSharpCodeProvider
$res = $provider.CompileAssemblyFromSource($cp, $csCode)

Remove-Item $icoFile -ErrorAction SilentlyContinue

if ($res.Errors.Count -gt 0) {
    foreach ($err in $res.Errors) {
        Write-Host "[ERRORE COMPILATORE] $($err.ErrorText)" -ForegroundColor Red
    }
    exit 1
}

if (Test-Path $exeFile) {
    Write-Host "`n[SUCCESSO] Easy11.exe v4.0 creato con icona e firma di $author!" -ForegroundColor Green
} else {
    Write-Host "`n[ERRORE] Easy11.exe non creato." -ForegroundColor Red
    exit 1
}