# ==============================================================================
# EASY11 v4.0.0 APEX EDITION - Ultimate Windows 11 Optimizer & Customizer
# Author: Tom Ardi
# ==============================================================================

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Windows.Forms

$BackupDir = Join-Path $env:USERPROFILE "Easy11_Backups"
if (!(Test-Path $BackupDir)) { New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null }

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Easy11 v4.0 Apex Edition - Windows 11 Ultimate Suite"
        Height="810" Width="1200"
        WindowStartupLocation="CenterScreen"
        ResizeMode="CanMinimize"
        Background="#F1F5F9" Foreground="#0F172A">

    <Window.Resources>
        <Style TargetType="Button" x:Key="NavBtn">
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="Foreground" Value="#475569"/>
            <Setter Property="FontSize" Value="13"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
            <Setter Property="HorizontalContentAlignment" Value="Left"/>
            <Setter Property="Padding" Value="12,9"/>
            <Setter Property="Margin" Value="0,1.5"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor" Value="Hand"/>
        </Style>
        <Style TargetType="Button" x:Key="ActionBtn">
            <Setter Property="Background" Value="#0284C7"/>
            <Setter Property="Foreground" Value="White"/>
            <Setter Property="FontSize" Value="13.5"/>
            <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Padding" Value="16,10"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor" Value="Hand"/>
        </Style>
    </Window.Resources>

    <Grid>
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="255"/>
            <ColumnDefinition Width="*"/>
        </Grid.ColumnDefinitions>

        <!-- SIDEBAR SINISTRA -->
        <Border x:Name="SidebarBorder" Grid.Column="0" Background="#FFFFFF" BorderBrush="#E2E8F0" BorderThickness="0,0,1,0" Padding="14">
            <Grid>
                <Grid.RowDefinitions>
                    <RowDefinition Height="Auto"/>
                    <RowDefinition Height="*"/>
                    <RowDefinition Height="Auto"/>
                </Grid.RowDefinitions>

                <!-- Logo & Brand -->
                <StackPanel Grid.Row="0" Margin="4,2,4,14">
                    <StackPanel Orientation="Horizontal">
                        <Border Background="#0284C7" CornerRadius="9" Width="36" Height="36" Margin="0,0,10,0">
                            <TextBlock Text="11" Foreground="White" FontWeight="Bold" FontSize="17" HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <StackPanel VerticalAlignment="Center">
                            <TextBlock x:Name="TxtBrand" Text="Easy11" FontSize="21" FontWeight="Bold" Foreground="#0F172A"/>
                            <TextBlock Text="v4.0 Apex • by Tom Ardi" FontSize="11" Foreground="#64748B"/>
                        </StackPanel>
                    </StackPanel>
                </StackPanel>

                <!-- Menu 8 Sezioni -->
                <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                    <StackPanel>
                        <TextBlock Text="CENTRO DI COMANDO" FontSize="10" FontWeight="Bold" Foreground="#94A3B8" Margin="10,0,0,4"/>
                        <Button x:Name="NavHome" Content="  🏠   Dashboard &amp; Profili" Style="{StaticResource NavBtn}" Background="#E0F2FE" Foreground="#0284C7"/>

                        <TextBlock Text="OTTIMIZZAZIONE &amp; SEGRETI" FontSize="10" FontWeight="Bold" Foreground="#94A3B8" Margin="10,10,0,4"/>
                        <Button x:Name="NavClean" Content="  🧹   Pulizia &amp; Spazio (11)" Style="{StaticResource NavBtn}"/>
                        <Button x:Name="NavKernel" Content="  🚀   Kernel, CPU &amp; RAM (10)" Style="{StaticResource NavBtn}"/>
                        <Button x:Name="NavUI" Content="  🎨   Interfaccia &amp; Explorer (11)" Style="{StaticResource NavBtn}"/>
                        <Button x:Name="NavNet" Content="  🌐   Rete, DNS &amp; Ping (8)" Style="{StaticResource NavBtn}"/>
                        <Button x:Name="NavPrivacy" Content="  🛡️   Privacy &amp; Debloat (11)" Style="{StaticResource NavBtn}"/>
                        <Button x:Name="NavApps" Content="  📦   App &amp; Avvio Rapido" Style="{StaticResource NavBtn}"/>
                        <Button x:Name="NavGaming" Content="  🎮   Modalita Gioco (Separata)" Style="{StaticResource NavBtn}"/>

                        <TextBlock Text="PROTEZIONE" FontSize="10" FontWeight="Bold" Foreground="#94A3B8" Margin="10,10,0,4"/>
                        <Button x:Name="NavUndo" Content="  ↩️   Torna Indietro &amp; Ripara" Style="{StaticResource NavBtn}" Foreground="#D97706"/>
                    </StackPanel>
                </ScrollViewer>

                <!-- Stato Sistema & Tema -->
                <StackPanel Grid.Row="2" Margin="0,8,0,0">
                    <Border x:Name="CardStatus" Background="#F8FAFC" BorderBrush="#E2E8F0" BorderThickness="1" CornerRadius="8" Padding="9" Margin="0,0,0,8">
                        <StackPanel>
                            <TextBlock x:Name="TxtDiskStat" Text="Disco C: -- GB liberi" FontSize="11.5" FontWeight="SemiBold" Foreground="#334155"/>
                            <TextBlock x:Name="TxtRamStat" Text="RAM: -- GB" FontSize="11.5" Foreground="#64748B" Margin="0,2,0,0"/>
                        </StackPanel>
                    </Border>
                    <CheckBox x:Name="ChkAutoBackup" Content="Backup automatico pre-modifica" IsChecked="True" FontSize="11.5" Foreground="#059669" FontWeight="SemiBold" Margin="2,0,0,8"/>
                    <Button x:Name="BtnThemeToggle" Content="🌙 Passa a Tema Scuro" Background="#F1F5F9" Foreground="#334155" FontSize="12" FontWeight="SemiBold" Padding="10,7" BorderThickness="0" Cursor="Hand"/>
                </StackPanel>
            </Grid>
        </Border>

        <!-- AREA PRINCIPALE -->
        <Grid Grid.Column="1" Margin="16">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="125"/>
                <RowDefinition Height="Auto"/>
            </Grid.RowDefinitions>

            <!-- Top Bar: Hardware + Ricerca Rapida + Profilo JSON -->
            <Border x:Name="TopBar" Grid.Row="0" Background="#FFFFFF" BorderBrush="#E2E8F0" BorderThickness="1" CornerRadius="10" Padding="12,8" Margin="0,0,0,10">
                <Grid>
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="*"/>
                        <ColumnDefinition Width="220"/>
                        <ColumnDefinition Width="Auto"/>
                    </Grid.ColumnDefinitions>
                    <TextBlock x:Name="TxtHwInfo" Text="Rilevamento hardware..." FontSize="11.5" FontWeight="SemiBold" Foreground="#475569" VerticalAlignment="Center"/>
                    <TextBox x:Name="TxtSearch" Grid.Column="1" Height="28" Padding="8,4" Margin="0,0,10,0" BorderBrush="#CBD5E1" BorderThickness="1" VerticalContentAlignment="Center" ToolTip="Filtra i tweak nella scheda aperta"/>
                    <StackPanel Grid.Column="2" Orientation="Horizontal">
                        <Button x:Name="BtnExportProfile" Content="💾 Salva Profilo" Background="#E0F2FE" Foreground="#0284C7" FontSize="11.5" FontWeight="Bold" Padding="10,5" Margin="0,0,6,0" BorderThickness="0" Cursor="Hand"/>
                        <Button x:Name="BtnImportProfile" Content="📂 Carica Profilo" Background="#F1F5F9" Foreground="#334155" FontSize="11.5" FontWeight="Bold" Padding="10,5" BorderThickness="0" Cursor="Hand"/>
                    </StackPanel>
                </Grid>
            </Border>

            <!-- CONTENITORE PAGINE -->
            <Border x:Name="MainCard" Grid.Row="1" Background="#FFFFFF" BorderBrush="#E2E8F0" BorderThickness="1" CornerRadius="12" Padding="16" Margin="0,0,0,10">
                <Grid>
                    <!-- 1. DASHBOARD & 5 SUPER-PROFILI -->
                    <Grid x:Name="PageHome" Visibility="Visible">
                        <StackPanel VerticalAlignment="Center" HorizontalAlignment="Center" Width="760">
                            <TextBlock x:Name="TxtHomeTitle" Text="Il tuo Windows 11, veloce e su misura" FontSize="24" FontWeight="Bold" HorizontalAlignment="Center" Foreground="#0F172A"/>
                            <TextBlock Text="Premi il pulsante centrale per una pulizia e ottimizzazione universale sicura al 100%, oppure scegli una delle 5 Super-Modalita preconfigurate."
                                       TextWrapping="Wrap" TextAlignment="Center" FontSize="13" Foreground="#64748B" Margin="0,6,0,18"/>

                            <Button x:Name="BtnQuickClean" Content="OTTIMIZZA E PULISCI PC ORA (1-CLICK SICURO)" Height="64" FontSize="19" Style="{StaticResource ActionBtn}" Background="#0284C7">
                                <Button.Resources>
                                    <Style TargetType="Border"><Setter Property="CornerRadius" Value="12"/></Style>
                                </Button.Resources>
                            </Button>

                            <TextBlock Text="5 SUPER-MODALITA SELEZIONABILI:" FontSize="11" FontWeight="Bold" Foreground="#94A3B8" HorizontalAlignment="Center" Margin="0,20,0,10"/>

                            <UniformGrid Columns="5">
                                <Button x:Name="BtnProfOffice" Background="#F8FAFC" BorderBrush="#CBD5E1" BorderThickness="1" Padding="8,12" Margin="0,0,5,0" Cursor="Hand">
                                    <StackPanel>
                                        <TextBlock Text="🏢 Ufficio / Casa" FontWeight="Bold" FontSize="12.5" Foreground="#0F172A" HorizontalAlignment="Center"/>
                                        <TextBlock Text="Pulizia + Zero Ads. Mantiene OneDrive e stampa." TextWrapping="Wrap" TextAlignment="Center" FontSize="10.5" Foreground="#64748B" Margin="0,4,0,0"/>
                                    </StackPanel>
                                </Button>
                                <Button x:Name="BtnProfLaptop" Background="#F8FAFC" BorderBrush="#CBD5E1" BorderThickness="1" Padding="8,12" Margin="2.5,0,2.5,0" Cursor="Hand">
                                    <StackPanel>
                                        <TextBlock Text="💻 Max Batteria" FontWeight="Bold" FontSize="12.5" Foreground="#0F172A" HorizontalAlignment="Center"/>
                                        <TextBlock Text="Stop app background, conserva ibernazione." TextWrapping="Wrap" TextAlignment="Center" FontSize="10.5" Foreground="#64748B" Margin="0,4,0,0"/>
                                    </StackPanel>
                                </Button>
                                <Button x:Name="BtnProfMax" Background="#F0F9FF" BorderBrush="#7DD3FC" BorderThickness="1" Padding="8,12" Margin="2.5,0,2.5,0" Cursor="Hand">
                                    <StackPanel>
                                        <TextBlock Text="🚀 Ultra-Fast" FontWeight="Bold" FontSize="12.5" Foreground="#0284C7" HorizontalAlignment="Center"/>
                                        <TextBlock Text="Kernel, CPU, UI istantanea e pulizia profonda." TextWrapping="Wrap" TextAlignment="Center" FontSize="10.5" Foreground="#0369A1" Margin="0,4,0,0"/>
                                    </StackPanel>
                                </Button>
                                <Button x:Name="BtnProfBunker" Background="#EEF2FF" BorderBrush="#A5B4FC" BorderThickness="1" Padding="8,12" Margin="2.5,0,2.5,0" Cursor="Hand">
                                    <StackPanel>
                                        <TextBlock Text="🛡️ Bunker Privacy" FontWeight="Bold" FontSize="12.5" Foreground="#4338CA" HorizontalAlignment="Center"/>
                                        <TextBlock Text="Blocca telemetria, Copilot, Bing, Recall e Ads." TextWrapping="Wrap" TextAlignment="Center" FontSize="10.5" Foreground="#4F46E5" Margin="0,4,0,0"/>
                                    </StackPanel>
                                </Button>
                                <Button x:Name="BtnProfGaming" Background="#FFFBEB" BorderBrush="#FCD34D" BorderThickness="1" Padding="8,12" Margin="5,0,0,0" Cursor="Hand">
                                    <StackPanel>
                                        <TextBlock Text="🎮 Gaming Pro" FontWeight="Bold" FontSize="12.5" Foreground="#B45309" HorizontalAlignment="Center"/>
                                        <TextBlock Text="Apre il pannello Gaming dedicato (separato)." TextWrapping="Wrap" TextAlignment="Center" FontSize="10.5" Foreground="#92400E" Margin="0,4,0,0"/>
                                    </StackPanel>
                                </Button>
                            </UniformGrid>
                        </StackPanel>
                    </Grid>

                    <!-- 2. PULIZIA & SPAZIO (11 OPZIONI) -->
                    <Grid x:Name="PageClean" Visibility="Collapsed">
                        <Grid.RowDefinitions>
                            <RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="Auto"/>
                        </Grid.RowDefinitions>
                        <DockPanel Grid.Row="0" Margin="0,0,0,8">
                            <TextBlock Text="Pulizia Profonda &amp; Recupero Spazio Disco" FontSize="17" FontWeight="Bold"/>
                            <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
                                <Button x:Name="BtnCleanAll" Content="Tutte" Background="#E2E8F0" Foreground="#1E293B" Padding="10,4" Margin="0,0,6,0" BorderThickness="0" Cursor="Hand"/>
                                <Button x:Name="BtnCleanNone" Content="Nessuna" Background="#E2E8F0" Foreground="#1E293B" Padding="10,4" BorderThickness="0" Cursor="Hand"/>
                            </StackPanel>
                        </DockPanel>
                        <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                            <StackPanel x:Name="PanelClean">
                                <CheckBox x:Name="C_Temp" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="File Temporanei Utente e Windows" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Elimina residui di installazioni e file temporanei in %TEMP% e C:\Windows\Temp." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="C_WinUpd" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Cache Download Windows Update" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Svuota SoftwareDistribution\Download recuperando fino a diversi GB." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="C_Prefetch" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Cache Prefetch e Miniature Esplora File" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Pulisce i vecchi file prefetch e ricostruisce la cache delle anteprime." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="C_Recycle" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Svuota Cestino di Tutte le Unita" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Elimina definitivamente tutti i file nel Cestino." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="C_Wer" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Report Errori Windows (WER) e Crash Dump" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Rimuove i file di diagnostica creati dopo errori o chiusure forzate." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="C_DeliveryOpt" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Cache Ottimizzazione Recapito (Delivery Optimization)" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Cancella i pacchetti P2P di Windows Update conservati sul disco." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="C_Trim" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Ottimizzazione TRIM Unita SSD/NVMe" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Invia il comando ReTrim al controller SSD per mantenere velocita massima." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="C_ShaderCache" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Pulizia Cache Shader DirectX" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Elimina gli shader compilati vecchi (utile dopo aggiornamenti driver GPU)." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="C_WinSxS" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Pulizia Componenti Obsoleti WinSxS (DISM)" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Compatta la cartella C:\Windows\WinSxS eliminando vecchi aggiornamenti." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="C_NoHiber" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Ibernazione (Recupera 4-16 GB su C:)" FontWeight="SemiBold"/><Border Background="#FEE2E2" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="ESPERTO" FontSize="9.5" FontWeight="Bold" Foreground="#991B1B"/></Border></StackPanel><TextBlock Text="Elimina hiberfil.sys. Sconsigliato su portatili se usi la sospensione ibernata." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                            </StackPanel>
                        </ScrollViewer>
                        <Button x:Name="BtnRunClean" Grid.Row="2" Content="ESEGUI PULIZIA SELEZIONATA" Style="{StaticResource ActionBtn}" Margin="0,8,0,0"/>
                    </Grid>

                    <!-- 3. KERNEL, CPU & RAM (10 SEGRETI) -->
                    <Grid x:Name="PageKernel" Visibility="Collapsed">
                        <Grid.RowDefinitions>
                            <RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="Auto"/>
                        </Grid.RowDefinitions>
                        <DockPanel Grid.Row="0" Margin="0,0,0,8">
                            <TextBlock Text="Segreti di Kernel, CPU, Memoria RAM &amp; Servizi" FontSize="17" FontWeight="Bold"/>
                            <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
                                <Button x:Name="BtnKernAll" Content="Tutte" Background="#E2E8F0" Foreground="#1E293B" Padding="10,4" Margin="0,0,6,0" BorderThickness="0" Cursor="Hand"/>
                                <Button x:Name="BtnKernNone" Content="Nessuna" Background="#E2E8F0" Foreground="#1E293B" Padding="10,4" BorderThickness="0" Cursor="Hand"/>
                            </StackPanel>
                        </DockPanel>
                        <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                            <StackPanel x:Name="PanelKernel">
                                <CheckBox x:Name="K_Power" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Sblocca e Attiva Piano 'Prestazioni Eccellenti'" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Attiva lo schema nascosto Ultimate Performance di Windows 11." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="K_Priority" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Priorita CPU alle Applicazioni in Primo Piano" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Imposta Win32PrioritySeparation = 38 per massima reattivita della finestra attiva." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="K_FastShut" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Spegnimento e Chiusura App Bloccate Ultra-Rapidi" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Riduce WaitToKillServiceTimeout a 2000ms e attiva AutoEndTasks." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="K_NoThrottle" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Power Throttling sulle App in Uso" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Impedisce a Windows di castrare la frequenza CPU dei programmi aperti." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="K_SvcSplit" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Ottimizza SvcHost Split Threshold in base alla RAM" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Riduce decine di processi svchost.exe duplicati in Gestione Attivita." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="K_NoSysMain" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Servizio SysMain (Superfetch) su SSD" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Inutile sugli SSD moderni: riduce letture su disco e uso RAM." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="K_NoSearchIdx" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Indicizzazione Windows Search" FontWeight="SemiBold"/><Border Background="#FEE2E2" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="ESPERTO" FontSize="9.5" FontWeight="Bold" Foreground="#991B1B"/></Border></StackPanel><TextBlock Text="Ferma l'indicizzazione continua dei file su disco (risparmia CPU e SSD)." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="K_NoMemComp" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Compressione Memoria RAM (Consigliato 16GB+ RAM)" FontWeight="SemiBold"/><Border Background="#FEE2E2" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="ESPERTO" FontSize="9.5" FontWeight="Bold" Foreground="#991B1B"/></Border></StackPanel><TextBlock Text="Evita cicli CPU sprecati per comprimere pagine RAM se hai molta memoria." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                            </StackPanel>
                        </ScrollViewer>
                        <Button x:Name="BtnRunKernel" Grid.Row="2" Content="APPLICA OTTIMIZZAZIONI KERNEL &amp; CPU" Style="{StaticResource ActionBtn}" Background="#0D9488" Margin="0,8,0,0"/>
                    </Grid>

                    <!-- 4. INTERFACCIA & ESPLORA FILE (11 TRICK) -->
                    <Grid x:Name="PageUI" Visibility="Collapsed">
                        <Grid.RowDefinitions>
                            <RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="Auto"/>
                        </Grid.RowDefinitions>
                        <DockPanel Grid.Row="0" Margin="0,0,0,8">
                            <TextBlock Text="Personalizzazione Interfaccia, Taskbar &amp; Esplora File" FontSize="17" FontWeight="Bold"/>
                            <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
                                <Button x:Name="BtnUiAll" Content="Tutte" Background="#E2E8F0" Foreground="#1E293B" Padding="10,4" Margin="0,0,6,0" BorderThickness="0" Cursor="Hand"/>
                                <Button x:Name="BtnUiNone" Content="Nessuna" Background="#E2E8F0" Foreground="#1E293B" Padding="10,4" BorderThickness="0" Cursor="Hand"/>
                            </StackPanel>
                        </DockPanel>
                        <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                            <StackPanel x:Name="PanelUI">
                                <CheckBox x:Name="U_FastMenu" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Apertura Istantanea Menu (MenuShowDelay = 0)" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Elimina i 400ms di attesa quando passi il mouse sui sottomenu." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="U_ShowExt" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Mostra Sempre Estensioni File (.exe, .pdf, .zip)" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Fondamentale per riconoscere subito il tipo reale di ogni file." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="U_ThisPC" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Apri Esplora File direttamente su 'Questo PC'" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Mostra subito i tuoi dischi invece della lenta schermata Home/Recenti." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="U_ClassicCtx" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Ripristina Menu Tasto Destro Classico (Stile Windows 10)" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Mostra tutte le voci (7-Zip, WinRAR, Proprieta) senza il clic extra." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="U_TaskbarLeft" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Allinea Menu Start e Icone Taskbar a Sinistra" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Sposta il pulsante Start nell'angolo classico in basso a sinistra." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="U_HideTaskView" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Pulisci Barra Applicazioni (Nascondi TaskView e Chat)" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Libera spazio visivo nella barra inferiore rimuovendo icone inutili." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="U_NoAnim" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Animazioni Finestre Superflue" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Apertura e chiusura istantanea delle finestre senza dissolvenze." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="U_ShowHidden" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Mostra File e Cartelle Nascoste (AppData, ecc.)" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Utile per accedere rapidamente alle cartelle di configurazione." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="U_RestartExp" IsChecked="True" Margin="0,4"><StackPanel><TextBlock Text="Riavvia Esplora File al Termine" FontWeight="SemiBold"/><TextBlock Text="Applica immediatamente le modifiche visive senza riavviare il PC." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                            </StackPanel>
                        </ScrollViewer>
                        <Button x:Name="BtnRunUI" Grid.Row="2" Content="APPLICA PERSONALIZZAZIONE INTERFACCIA" Style="{StaticResource ActionBtn}" Background="#2563EB" Margin="0,8,0,0"/>
                    </Grid>

                    <!-- 5. RETE, DNS & BASSA LATENZA (8 TRICK) -->
                    <Grid x:Name="PageNet" Visibility="Collapsed">
                        <Grid.RowDefinitions>
                            <RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="Auto"/>
                        </Grid.RowDefinitions>
                        <TextBlock Grid.Row="0" Text="Ottimizzazione Rete, TCP/IP &amp; Cambio DNS Rapido" FontSize="17" FontWeight="Bold" Margin="0,0,0,8"/>
                        <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                            <StackPanel x:Name="PanelNet">
                                <CheckBox x:Name="N_TcpAuto" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Ottimizza TCP Auto-Tuning e Receive Side Scaling (RSS)" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Sfrutta tutti i core CPU per gestire il traffico di rete ad alta velocita." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="N_NoQos" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Sblocca il 100% della Banda (Rimuovi Limite Riservato QoS)" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Imposta NonBestEffortLimit = 0 per non riservare banda ai servizi Windows." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="N_NoNagle" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Algoritmo di Nagle (Invio Pacchetti Immediato)" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Riduce la latenza di rete evitando l'attesa di accorpamento dei pacchetti." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="N_NicPower" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Risparmio Energetico Schede Ethernet/Wi-Fi" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Evita micro-disconnessioni e picchi di latenza." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="N_Flush" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Svuota Cache DNS e Rinnova Socket" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Esegue ipconfig /flushdns per eliminare risoluzioni lente o corrotte." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>

                                <TextBlock Text="CAMBIO DNS ULTRA-VELOCE CON UN CLIC (Sulle schede attive):" FontSize="11.5" FontWeight="Bold" Foreground="#0284C7" Margin="0,14,0,6"/>
                                <UniformGrid Columns="4">
                                    <Button x:Name="BtnDnsCloudflare" Content="⚡ Cloudflare (1.1.1.1)" Background="#E0F2FE" Foreground="#0369A1" FontWeight="Bold" Padding="8" Margin="0,0,4,0" BorderThickness="0" Cursor="Hand"/>
                                    <Button x:Name="BtnDnsGoogle" Content="🌐 Google (8.8.8.8)" Background="#E0F2FE" Foreground="#0369A1" FontWeight="Bold" Padding="8" Margin="2,0,2,0" BorderThickness="0" Cursor="Hand"/>
                                    <Button x:Name="BtnDnsQuad9" Content="🛡️ Quad9 Sicuro (9.9.9.9)" Background="#E0F2FE" Foreground="#0369A1" FontWeight="Bold" Padding="8" Margin="2,0,2,0" BorderThickness="0" Cursor="Hand"/>
                                    <Button x:Name="BtnDnsAuto" Content="🔄 Ripristina DNS Auto" Background="#F1F5F9" Foreground="#334155" FontWeight="Bold" Padding="8" Margin="4,0,0,0" BorderThickness="0" Cursor="Hand"/>
                                </UniformGrid>
                            </StackPanel>
                        </ScrollViewer>
                        <Button x:Name="BtnRunNet" Grid.Row="2" Content="APPLICA OTTIMIZZAZIONI RETE" Style="{StaticResource ActionBtn}" Background="#0284C7" Margin="0,8,0,0"/>
                    </Grid>

                    <!-- 6. PRIVACY, TELEMETRIA & AI BLOAT (11 OPZIONI) -->
                    <Grid x:Name="PagePrivacy" Visibility="Collapsed">
                        <Grid.RowDefinitions>
                            <RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="Auto"/>
                        </Grid.RowDefinitions>
                        <DockPanel Grid.Row="0" Margin="0,0,0,8">
                            <TextBlock Text="Privacy Totale, Telemetria &amp; Controllo Funzioni AI" FontSize="17" FontWeight="Bold"/>
                            <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
                                <Button x:Name="BtnPrivAll" Content="Tutte" Background="#E2E8F0" Foreground="#1E293B" Padding="10,4" Margin="0,0,6,0" BorderThickness="0" Cursor="Hand"/>
                                <Button x:Name="BtnPrivNone" Content="Nessuna" Background="#E2E8F0" Foreground="#1E293B" Padding="10,4" BorderThickness="0" Cursor="Hand"/>
                            </StackPanel>
                        </DockPanel>
                        <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                            <StackPanel x:Name="PanelPrivacy">
                                <CheckBox x:Name="R_NoAds" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Rimuovi Annunci e Suggerimenti dal Menu Start e Lockscreen" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Elimina app sponsorizzate e suggerimenti commerciali." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="R_Telemetry" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Riduci Telemetria Diagnostica al Minimo (AllowTelemetry = 0)" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Blocca l'invio di dati diagnostici e statistiche d'uso." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="R_StopDiag" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Servizi Telemetria DiagTrack e dmwappushservice" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Ferma i servizi di tracciamento in background." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="R_Bing" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Ricerca Web/Bing nel Menu Start" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="La barra di ricerca cerca solo sul tuo PC istantaneamente." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="R_AdId" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva ID Pubblicitario e Cronologia Attivita" FontWeight="SemiBold"/><Border Background="#DCFCE7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="SICURO" FontSize="9.5" FontWeight="Bold" Foreground="#166534"/></Border></StackPanel><TextBlock Text="Impedisce la profilazione tra app e la registrazione cronologia." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="R_BgApps" IsChecked="True" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Blocca App Store (UWP) in Background" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Risparmia RAM e batteria chiudendo processi invisibili." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="R_Widgets" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Widget e Feed Notizie" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Libera oltre 150MB di RAM eliminando il processo WebView dei widget." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="R_Copilot" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disattiva Windows Copilot e Windows Recall" FontWeight="SemiBold"/><Border Background="#FEF3C7" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="AVANZATO" FontSize="9.5" FontWeight="Bold" Foreground="#92400E"/></Border></StackPanel><TextBlock Text="Disabilita assistente Copilot e cattura schermate AI Recall." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="R_OneDrive" IsChecked="False" Margin="0,4"><StackPanel><StackPanel Orientation="Horizontal"><TextBlock Text="Disinstalla Completamente OneDrive" FontWeight="SemiBold"/><Border Background="#FEE2E2" CornerRadius="4" Padding="5,1" Margin="8,0,0,0"><TextBlock Text="ESPERTO" FontSize="9.5" FontWeight="Bold" Foreground="#991B1B"/></Border></StackPanel><TextBlock Text="Spunta solo se non usi il cloud OneDrive." FontSize="11" Foreground="#DC2626"/></StackPanel></CheckBox>
                            </StackPanel>
                        </ScrollViewer>
                        <Button x:Name="BtnRunPrivacy" Grid.Row="2" Content="APPLICA PROTEZIONE PRIVACY" Style="{StaticResource ActionBtn}" Background="#4F46E5" Margin="0,8,0,0"/>
                    </Grid>

                    <!-- 7. GESTORE APP & AVVIO RAPIDO (DOPPIA LISTA) -->
                    <Grid x:Name="PageApps" Visibility="Collapsed">
                        <Grid.ColumnDefinitions>
                            <ColumnDefinition Width="*"/><ColumnDefinition Width="*"/>
                        </Grid.ColumnDefinitions>
                        <!-- Sinistra: App Bloatware -->
                        <Grid Grid.Column="0" Margin="0,0,8,0">
                            <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="Auto"/></Grid.RowDefinitions>
                            <TextBlock Grid.Row="0" Text="📦 App Preinstallate Rilevate" FontSize="15" FontWeight="Bold" Margin="0,0,0,6"/>
                            <ListBox x:Name="LstBloatApps" Grid.Row="1" BorderBrush="#E2E8F0" BorderThickness="1" Padding="4"/>
                            <Button x:Name="BtnRemoveSelectedApps" Grid.Row="2" Content="🗑️ Rimuovi App Selezionate" Style="{StaticResource ActionBtn}" Background="#DC2626" Margin="0,8,0,0"/>
                        </Grid>
                        <!-- Destra: Programmi all'Avvio -->
                        <Grid Grid.Column="1" Margin="8,0,0,0">
                            <Grid.RowDefinitions><RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="Auto"/></Grid.RowDefinitions>
                            <TextBlock Grid.Row="0" Text="⏱️ Programmi all'Avvio di Windows" FontSize="15" FontWeight="Bold" Margin="0,0,0,6"/>
                            <ListBox x:Name="LstStartup" Grid.Row="1" BorderBrush="#E2E8F0" BorderThickness="1" Padding="4"/>
                            <Button x:Name="BtnRemoveStartup" Grid.Row="2" Content="🚫 Disattiva Avvio Selezionati" Style="{StaticResource ActionBtn}" Background="#D97706" Margin="0,8,0,0"/>
                        </Grid>
                    </Grid>

                    <!-- 8. MODALITA GIOCO (SEPARATA) -->
                    <Grid x:Name="PageGaming" Visibility="Collapsed">
                        <Grid.RowDefinitions>
                            <RowDefinition Height="Auto"/><RowDefinition Height="*"/><RowDefinition Height="Auto"/>
                        </Grid.RowDefinitions>
                        <StackPanel Grid.Row="0" Margin="0,0,0,8">
                            <TextBlock Text="Modalita Gioco &amp; E-Sports (100% Separata e Reversibile)" FontSize="17" FontWeight="Bold"/>
                            <TextBlock Text="Attivala solo su PC da gaming. Puoi disattivarla in qualsiasi momento con il pulsante grigio." FontSize="11.5" Foreground="#64748B"/>
                        </StackPanel>
                        <ScrollViewer Grid.Row="1" VerticalScrollBarVisibility="Auto">
                            <StackPanel x:Name="PanelGaming">
                                <CheckBox x:Name="G_GameMode" IsChecked="True" Margin="0,4"><StackPanel><TextBlock Text="Attiva Modalita Gioco Windows + HAGS (GPU Scheduling)" FontWeight="SemiBold"/><TextBlock Text="Riduce latenza di rendering e da priorita alle risorse GPU." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="G_NoDvr" IsChecked="True" Margin="0,4"><StackPanel><TextBlock Text="Disattiva GameDVR e Registrazione Clip in Background" FontWeight="SemiBold"/><TextBlock Text="Elimina cali di FPS e stuttering causati dalla cattura video continua." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="G_Mmcss" IsChecked="True" Margin="0,4"><StackPanel><TextBlock Text="Ottimizza Multimedia Class Scheduler (MMCSS Games)" FontWeight="SemiBold"/><TextBlock Text="Imposta GPU Priority = 8 e Scheduling Category = High per i giochi." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="G_Mouse" IsChecked="True" Margin="0,4"><StackPanel><TextBlock Text="Disattiva Accelerazione Mouse (Precisione Puntatore OFF)" FontWeight="SemiBold"/><TextBlock Text="Movimento 1:1 reale senza curva di accelerazione Windows." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="G_NoFso" IsChecked="False" Margin="0,4"><StackPanel><TextBlock Text="Disattiva Ottimizzazioni Schermo Intero (FSO) Globali" FontWeight="SemiBold"/><TextBlock Text="Riduce input lag nei giochi DirectX 11/12 in modalita schermo intero esclusivo." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                                <CheckBox x:Name="G_Shaders" IsChecked="False" Margin="0,4"><StackPanel><TextBlock Text="Pulisci Cache Shader DirectX" FontWeight="SemiBold"/><TextBlock Text="Risolve micro-scatti dopo aggiornamenti driver NVIDIA/AMD." FontSize="11" Foreground="#64748B"/></StackPanel></CheckBox>
                            </StackPanel>
                        </ScrollViewer>
                        <Grid Grid.Row="2" Margin="0,8,0,0">
                            <Grid.ColumnDefinitions><ColumnDefinition Width="2*"/><ColumnDefinition Width="*"/></Grid.ColumnDefinitions>
                            <Button x:Name="BtnRunGaming" Grid.Column="0" Content="🎮 ATTIVA PROFILO GAMING PRO" Style="{StaticResource ActionBtn}" Background="#D97706" Margin="0,0,8,0"/>
                            <Button x:Name="BtnDisableGaming" Grid.Column="1" Content="DISATTIVA PROFILO GAMING" Style="{StaticResource ActionBtn}" Background="#64748B"/>
                        </Grid>
                    </Grid>

                    <!-- 9. TORNA INDIETRO & RIPARAZIONE -->
                    <Grid x:Name="PageUndo" Visibility="Collapsed">
                        <StackPanel VerticalAlignment="Center" HorizontalAlignment="Center" Width="660">
                            <TextBlock Text="Centro Sicurezza: Torna Indietro &amp; Ripara Windows" FontSize="20" FontWeight="Bold" HorizontalAlignment="Center"/>
                            <TextBlock Text="Hai cambiato idea? Ripristina istantaneamente il backup automatico del registro oppure riporta singole aree ai valori originali Microsoft."
                                       TextWrapping="Wrap" TextAlignment="Center" FontSize="12.5" Foreground="#64748B" Margin="0,6,0,18"/>

                            <Button x:Name="BtnRestoreLastBackup" Content="↩️  ANNULLA ULTIMA SESSIONE (RIPRISTINA BACKUP REGISTRO)" Height="46" Style="{StaticResource ActionBtn}" Background="#DC2626" Margin="0,0,0,12"/>

                            <UniformGrid Columns="2" Margin="0,0,0,12">
                                <Button x:Name="BtnUndoUiPrivacy" Content="Ripristina Default UI &amp; Privacy" Background="#F1F5F9" Foreground="#1E293B" FontWeight="SemiBold" Padding="12" Margin="0,0,6,0" BorderThickness="0" Cursor="Hand"/>
                                <Button x:Name="BtnUndoPowerNet" Content="Ripristina Default Kernel, Rete &amp; Gaming" Background="#F1F5F9" Foreground="#1E293B" FontWeight="SemiBold" Padding="12" Margin="6,0,0,0" BorderThickness="0" Cursor="Hand"/>
                            </UniformGrid>

                            <UniformGrid Columns="2">
                                <Button x:Name="BtnRepairDismSfc" Content="🛠️ Ripara File Windows (DISM + SFC)" Background="#0284C7" Foreground="White" FontWeight="Bold" Padding="12" Margin="0,0,6,0" BorderThickness="0" Cursor="Hand"/>
                                <Button x:Name="BtnOpenSysRestore" Content="🕒 Apri Ripristino Configurazione Windows" Background="#334155" Foreground="White" FontWeight="Bold" Padding="12" Margin="6,0,0,0" BorderThickness="0" Cursor="Hand"/>
                            </UniformGrid>
                        </StackPanel>
                    </Grid>
                </Grid>
            </Border>

            <!-- CONSOLE LOG -->
            <Border Grid.Row="2" Background="#0F172A" CornerRadius="10" Padding="10" Margin="0,0,0,8">
                <TextBox x:Name="TxtLog" Background="Transparent" Foreground="#38BDF8" FontFamily="Consolas" FontSize="12"
                         BorderThickness="0" IsReadOnly="True" VerticalScrollBarVisibility="Auto" TextWrapping="Wrap"
                         Text="[PRONTO] Easy11 v4.0 Apex Edition avviato. Ogni azione crea prima un backup di sicurezza."/>
            </Border>

            <!-- PROGRESS BAR -->
            <ProgressBar x:Name="ProgBar" Grid.Row="3" Height="14" Minimum="0" Maximum="100" Value="0" Background="#E2E8F0" Foreground="#0284C7" BorderThickness="0"/>
        </Grid>
    </Grid>
</Window>
"@

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$xaml.SelectNodes("//*[@*[contains(translate(name(.),'n','N'),'Name')]]") | ForEach-Object {
    Set-Variable -Name $_.Name -Value $window.FindName($_.Name)
}

# --- NAVIGAZIONE ---
$pages = @($PageHome, $PageClean, $PageKernel, $PageUI, $PageNet, $PagePrivacy, $PageApps, $PageGaming, $PageUndo)
$navBtns = @($NavHome, $NavClean, $NavKernel, $NavUI, $NavNet, $NavPrivacy, $NavApps, $NavGaming, $NavUndo)
$script:isDark = $false

function Show-Page($index) {
    for ($i = 0; $i -lt $pages.Count; $i++) {
        $pages[$i].Visibility = if ($i -eq $index) { "Visible" } else { "Collapsed" }
        if ($i -eq $index) {
            $navBtns[$i].Background = if ($script:isDark) { "#1E3A5F" } else { "#E0F2FE" }
            $navBtns[$i].Foreground = "#0284C7"
        } else {
            $navBtns[$i].Background = "Transparent"
            $navBtns[$i].Foreground = if ($script:isDark) { "#CBD5E1" } else { "#475569" }
        }
    }
}

$NavHome.Add_Click({ Show-Page 0 })
$NavClean.Add_Click({ Show-Page 1 })
$NavKernel.Add_Click({ Show-Page 2 })
$NavUI.Add_Click({ Show-Page 3 })
$NavNet.Add_Click({ Show-Page 4 })
$NavPrivacy.Add_Click({ Show-Page 5 })
$NavApps.Add_Click({ Show-Page 6; Load-AppsAndStartup })
$NavGaming.Add_Click({ Show-Page 7 })
$NavUndo.Add_Click({ Show-Page 8 })

# --- FILTRO DI RICERCA ISTANTANEA ---
$TxtSearch.Text = "Cerca tweak..."
$TxtSearch.Foreground = "#94A3B8"
$TxtSearch.Add_GotFocus({
    if ($TxtSearch.Text -eq "Cerca tweak...") { $TxtSearch.Text = ""; $TxtSearch.Foreground = if ($script:isDark) { "#F8FAFC" } else { "#0F172A" } }
})
$TxtSearch.Add_TextChanged({
    if ($TxtSearch.Text -eq "Cerca tweak...") { return }
    $q = $TxtSearch.Text.ToLower().Trim()
    foreach ($panel in @($PanelClean, $PanelKernel, $PanelUI, $PanelNet, $PanelPrivacy, $PanelGaming)) {
        foreach ($child in $panel.Children) {
            if ($child -is [System.Windows.Controls.CheckBox]) {
                $txt = ($child.Content.Children | ForEach-Object { if ($_ -is [System.Windows.Controls.TextBlock]) { $_.Text } elseif ($_ -is [System.Windows.Controls.StackPanel]) { ($_.Children | Where-Object { $_ -is [System.Windows.Controls.TextBlock] } | ForEach-Object { $_.Text }) -join " " } }) -join " "
                $child.Visibility = if ([string]::IsNullOrEmpty($q) -or $txt.ToLower().Contains($q)) { "Visible" } else { "Collapsed" }
            }
        }
    }
})

# --- 5 SUPER-PROFILI ---
$BtnProfOffice.Add_Click({
    @($C_Temp,$C_WinUpd,$C_Prefetch,$C_Recycle,$C_Wer,$C_DeliveryOpt,$C_Trim,$K_FastShut,$U_FastMenu,$U_ShowExt,$U_ThisPC,$N_TcpAuto,$N_Flush,$R_NoAds,$R_Telemetry,$R_Bing,$R_AdId) | ForEach-Object { $_.IsChecked = $true }
    @($C_NoHiber,$K_NoSearchIdx,$R_OneDrive) | ForEach-Object { $_.IsChecked = $false }
    Show-Page 1
    Write-Log "[PROFILO UFFICIO/CASA] Selezionate le opzioni ottimali per lavoro e casa!" 100
})

$BtnProfLaptop.Add_Click({
    @($C_Temp,$C_WinUpd,$C_Prefetch,$C_Recycle,$C_Trim,$K_FastShut,$U_FastMenu,$N_NicPower,$R_NoAds,$R_Telemetry,$R_BgApps,$R_Widgets) | ForEach-Object { $_.IsChecked = $true }
    @($C_NoHiber,$K_Power,$K_NoThrottle) | ForEach-Object { $_.IsChecked = $false }
    Show-Page 2
    Write-Log "[PROFILO MAX BATTERIA] Ottimizzato per autonomia e silenziosita su portatile." 100
})

$BtnProfMax.Add_Click({
    @($C_Temp,$C_WinUpd,$C_Prefetch,$C_Recycle,$C_Wer,$C_DeliveryOpt,$C_Trim,$K_Power,$K_Priority,$K_FastShut,$K_NoThrottle,$K_SvcSplit,$U_FastMenu,$U_ShowExt,$U_ThisPC,$U_ClassicCtx,$U_NoAnim,$N_TcpAuto,$N_NoQos,$N_NoNagle,$N_NicPower,$R_NoAds,$R_Telemetry,$R_StopDiag,$R_Bing,$R_AdId,$R_BgApps,$R_Widgets) | ForEach-Object { $_.IsChecked = $true }
    Show-Page 2
    Write-Log "[PROFILO ULTRA-FAST] Massima velocita CPU, Kernel, Rete e UI selezionata!" 100
})

$BtnProfBunker.Add_Click({
    @($R_NoAds,$R_Telemetry,$R_StopDiag,$R_Bing,$R_AdId,$R_BgApps,$R_Widgets,$R_Copilot) | ForEach-Object { $_.IsChecked = $true }
    Show-Page 5
    Write-Log "[PROFILO BUNKER PRIVACY] Telemetria, Copilot, Recall e annunci pronti per essere bloccati." 100
})

$BtnProfGaming.Add_Click({ Show-Page 7 })

# --- ESPORTA / IMPORTA PROFILO JSON ---
$allCheckNames = @("C_Temp","C_WinUpd","C_Prefetch","C_Recycle","C_Wer","C_DeliveryOpt","C_Trim","C_ShaderCache","C_WinSxS","C_NoHiber","K_Power","K_Priority","K_FastShut","K_NoThrottle","K_SvcSplit","K_NoSysMain","K_NoSearchIdx","K_NoMemComp","U_FastMenu","U_ShowExt","U_ThisPC","U_ClassicCtx","U_TaskbarLeft","U_HideTaskView","U_NoAnim","U_ShowHidden","U_RestartExp","N_TcpAuto","N_NoQos","N_NoNagle","N_NicPower","N_Flush","R_NoAds","R_Telemetry","R_StopDiag","R_Bing","R_AdId","R_BgApps","R_Widgets","R_Copilot","R_OneDrive","G_GameMode","G_NoDvr","G_Mmcss","G_Mouse","G_NoFso","G_Shaders")

$BtnExportProfile.Add_Click({
    $dlg = New-Object System.Windows.Forms.SaveFileDialog
    $dlg.Filter = "Profilo Easy11 (*.json)|*.json"
    $dlg.FileName = "Mio_Profilo_Easy11.json"
    if ($dlg.ShowDialog() -eq "OK") {
        $state = @{}
        foreach ($n in $allCheckNames) { $state[$n] = (Get-Variable -Name $n -ValueOnly).IsChecked }
        $state | ConvertTo-Json | Out-File -FilePath $dlg.FileName -Encoding UTF8
        Write-Log "[PROFILO] Salvato in: $($dlg.FileName)" 100
    }
})

$BtnImportProfile.Add_Click({
    $dlg = New-Object System.Windows.Forms.OpenFileDialog
    $dlg.Filter = "Profilo Easy11 (*.json)|*.json"
    if ($dlg.ShowDialog() -eq "OK") {
        $state = Get-Content -Path $dlg.FileName -Raw | ConvertFrom-Json
        foreach ($n in $allCheckNames) {
            if ($null -ne $state.$n) { (Get-Variable -Name $n -ValueOnly).IsChecked = [bool]$state.$n }
        }
        Write-Log "[PROFILO] Caricato da: $($dlg.FileName)" 100
    }
})

# --- TEMA CHIARO / SCURO ---
$BtnThemeToggle.Add_Click({
    $script:isDark = -not $script:isDark
    if ($script:isDark) {
        $window.Background = "#0B0F19"; $SidebarBorder.Background = "#111827"; $SidebarBorder.BorderBrush = "#1F2937"
        $TopBar.Background = "#111827"; $TopBar.BorderBrush = "#1F2937"; $MainCard.Background = "#111827"; $MainCard.BorderBrush = "#1F2937"
        $CardStatus.Background = "#1F2937"; $CardStatus.BorderBrush = "#374151"; $TxtBrand.Foreground = "#F8FAFC"
        $TxtHomeTitle.Foreground = "#F8FAFC"; $TxtHwInfo.Foreground = "#94A3B8"; $TxtDiskStat.Foreground = "#E2E8F0"
        $BtnThemeToggle.Content = "☀️ Passa a Tema Chiaro"; $BtnThemeToggle.Background = "#1F2937"; $BtnThemeToggle.Foreground = "#F8FAFC"
    } else {
        $window.Background = "#F1F5F9"; $SidebarBorder.Background = "#FFFFFF"; $SidebarBorder.BorderBrush = "#E2E8F0"
        $TopBar.Background = "#FFFFFF"; $TopBar.BorderBrush = "#E2E8F0"; $MainCard.Background = "#FFFFFF"; $MainCard.BorderBrush = "#E2E8F0"
        $CardStatus.Background = "#F8FAFC"; $CardStatus.BorderBrush = "#E2E8F0"; $TxtBrand.Foreground = "#0F172A"
        $TxtHomeTitle.Foreground = "#0F172A"; $TxtHwInfo.Foreground = "#475569"; $TxtDiskStat.Foreground = "#334155"
        $BtnThemeToggle.Content = "🌙 Passa a Tema Scuro"; $BtnThemeToggle.Background = "#F1F5F9"; $BtnThemeToggle.Foreground = "#334155"
    }
    Show-Page ([array]::IndexOf($pages, ($pages | Where-Object { $_.Visibility -eq "Visible" })))
})

function Update-Stats {
    try {
        $cpu = (Get-CimInstance Win32_Processor | Select-Object -First 1).Name.Trim()
        $gpu = (Get-CimInstance Win32_VideoController | Select-Object -First 1).Name.Trim()
        $cs  = Get-CimInstance Win32_ComputerSystem
        $os  = Get-CimInstance Win32_OperatingSystem
        $totRam = [math]::Round($cs.TotalPhysicalMemory / 1GB, 1)
        $usedRam = [math]::Round($totRam - ($os.FreePhysicalMemory / 1MB), 1)
        $freeDisk = [math]::Round((Get-PSDrive C).Free / 1GB, 1)
        $TxtHwInfo.Text = "CPU: $cpu  |  GPU: $gpu"
        $TxtDiskStat.Text = "Disco C: $freeDisk GB liberi"
        $TxtRamStat.Text = "RAM: $usedRam / $totRam GB"
    } catch {}
}
Update-Stats

function Write-Log($msg, $pct = -1) {
    $TxtLog.AppendText("`r`n$msg")
    $TxtLog.ScrollToEnd()
    if ($pct -ge 0) { $ProgBar.Value = $pct }
    [System.Windows.Forms.Application]::DoEvents()
}

function Create-SafetyBackup {
    if (-not $ChkAutoBackup.IsChecked) { return }
    $stamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $sessionDir = Join-Path $BackupDir "Backup_$stamp"
    New-Item -ItemType Directory -Path $sessionDir -Force | Out-Null
    Write-Log "[BACKUP] Salvataggio registro di sicurezza in $sessionDir..." 5
    reg export "HKCU\Control Panel\Desktop" "$sessionDir\hkcu_desktop.reg" /y | Out-Null
    reg export "HKCU\Control Panel\Mouse" "$sessionDir\hkcu_mouse.reg" /y | Out-Null
    reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "$sessionDir\hkcu_cdm.reg" /y | Out-Null
    reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "$sessionDir\hkcu_exp.reg" /y | Out-Null
    reg export "HKCU\System\GameConfigStore" "$sessionDir\hkcu_game.reg" /y | Out-Null
    $sessionDir | Out-File -FilePath (Join-Path $BackupDir "latest.txt") -Encoding UTF8
    try {
        Enable-ComputerRestore -Drive "C:\" -ErrorAction SilentlyContinue
        Checkpoint-Computer -Description "Easy11_$stamp" -RestorePointType "MODIFY_SETTINGS" -ErrorAction SilentlyContinue
    } catch {}
}

# --- 1. PULIZIA RAPIDA 1-CLICK ---
$BtnQuickClean.Add_Click({
    $BtnQuickClean.IsEnabled = $false
    $TxtLog.Clear()
    $before = (Get-PSDrive C).Free
    Write-Log "=== OTTIMIZZAZIONE E PULIZIA UNIVERSALE EASY11 ===" 0
    Create-SafetyBackup

    Write-Log "[1/5] Pulizia Temp, WER e Delivery Optimization..." 25
    Remove-Item "$env:TEMP\*","C:\Windows\Temp\*","C:\ProgramData\Microsoft\Windows\WER\ReportArchive\*","C:\Windows\SoftwareDistribution\DeliveryOptimization\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue

    Write-Log "[2/5] Pulizia Prefetch, Miniature e Cestino..." 45
    Remove-Item "C:\Windows\Prefetch\*","$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" -Recurse -Force -ErrorAction SilentlyContinue
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue

    Write-Log "[3/5] Svuotamento cache Windows Update e DNS..." 65
    Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
    Remove-Item "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
    Start-Service wuauserv -ErrorAction SilentlyContinue
    ipconfig /flushdns | Out-Null

    Write-Log "[4/5] Ottimizzazione SSD TRIM, Rete TCP/IP e QoS..." 80
    Optimize-Volume -DriveLetter C -ReTrim -ErrorAction SilentlyContinue
    netsh int tcp set global autotuninglevel=normal | Out-Null
    netsh int tcp set global rss=enabled | Out-Null
    New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" -Force | Out-Null
    Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" -Name "NonBestEffortLimit" -Value 0 -ErrorAction SilentlyContinue

    Write-Log "[5/5] Menu istantanei e rimozione annunci Start..." 95
    Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value "0" -ErrorAction SilentlyContinue
    New-Item "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Force | Out-Null
    Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Value 0 -ErrorAction SilentlyContinue

    $freed = [math]::Max(0, [math]::Round(((Get-PSDrive C).Free - $before) / 1MB, 1))
    Update-Stats
    Write-Log "=== COMPLETATO! Spazio liberato: ~$freed MB ===" 100
    $BtnQuickClean.IsEnabled = $true
    [System.Windows.MessageBox]::Show("Ottimizzazione completata!`r`nSpazio liberato: ~$freed MB", "Easy11 v4.0", "OK", "Information")
})

# --- 2. PULIZIA PROFONDA ---
$BtnCleanAll.Add_Click({ @($C_Temp,$C_WinUpd,$C_Prefetch,$C_Recycle,$C_Wer,$C_DeliveryOpt,$C_Trim,$C_ShaderCache,$C_WinSxS,$C_NoHiber) | ForEach-Object { $_.IsChecked = $true } })
$BtnCleanNone.Add_Click({ @($C_Temp,$C_WinUpd,$C_Prefetch,$C_Recycle,$C_Wer,$C_DeliveryOpt,$C_Trim,$C_ShaderCache,$C_WinSxS,$C_NoHiber) | ForEach-Object { $_.IsChecked = $false } })

$BtnRunClean.Add_Click({
    $TxtLog.Clear(); $before = (Get-PSDrive C).Free
    Write-Log "=== PULIZIA PROFONDA ===" 15
    if ($C_Temp.IsChecked)        { Remove-Item "$env:TEMP\*","C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue }
    if ($C_WinUpd.IsChecked)      { Stop-Service wuauserv -Force -ErrorAction SilentlyContinue; Remove-Item "C:\Windows\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue; Start-Service wuauserv -ErrorAction SilentlyContinue }
    if ($C_Prefetch.IsChecked)    { Remove-Item "C:\Windows\Prefetch\*","$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" -Recurse -Force -ErrorAction SilentlyContinue }
    if ($C_Recycle.IsChecked)     { Clear-RecycleBin -Force -ErrorAction SilentlyContinue }
    if ($C_Wer.IsChecked)         { Remove-Item "C:\ProgramData\Microsoft\Windows\WER\ReportArchive\*" -Recurse -Force -ErrorAction SilentlyContinue }
    if ($C_DeliveryOpt.IsChecked) { Remove-Item "C:\Windows\SoftwareDistribution\DeliveryOptimization\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue }
    if ($C_Trim.IsChecked)        { Optimize-Volume -DriveLetter C -ReTrim -ErrorAction SilentlyContinue }
    if ($C_ShaderCache.IsChecked) { Remove-Item "$env:LOCALAPPDATA\D3DSCache\*" -Recurse -Force -ErrorAction SilentlyContinue }
    if ($C_WinSxS.IsChecked)      { Start-Process "dism.exe" "/Online /Cleanup-Image /StartComponentCleanup" -Wait -WindowStyle Hidden }
    if ($C_NoHiber.IsChecked)     { powercfg -h off | Out-Null }
    $freed = [math]::Max(0, [math]::Round(((Get-PSDrive C).Free - $before) / 1MB, 1))
    Update-Stats
    Write-Log "=== PULIZIA COMPLETATA! Spazio liberato: ~$freed MB ===" 100
})

# --- 3. KERNEL, CPU & RAM ---
$BtnKernAll.Add_Click({ @($K_Power,$K_Priority,$K_FastShut,$K_NoThrottle,$K_SvcSplit,$K_NoSysMain,$K_NoSearchIdx,$K_NoMemComp) | ForEach-Object { $_.IsChecked = $true } })
$BtnKernNone.Add_Click({ @($K_Power,$K_Priority,$K_FastShut,$K_NoThrottle,$K_SvcSplit,$K_NoSysMain,$K_NoSearchIdx,$K_NoMemComp) | ForEach-Object { $_.IsChecked = $false } })

$BtnRunKernel.Add_Click({
    $TxtLog.Clear(); Create-SafetyBackup
    Write-Log "=== APPLICAZIONE TWEAK KERNEL, CPU & RAM ===" 20
    if ($K_Power.IsChecked) {
        $dup = powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 2>$null
        if ($dup -match "([a-f0-9-]{36})") { powercfg -setactive $matches[1] | Out-Null } else { powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c | Out-Null }
    }
    if ($K_Priority.IsChecked)   { Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 38 -ErrorAction SilentlyContinue }
    if ($K_FastShut.IsChecked)   { Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "AutoEndTasks" -Value "1" -ErrorAction SilentlyContinue; Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "WaitToKillServiceTimeout" -Value "2000" -ErrorAction SilentlyContinue }
    if ($K_NoThrottle.IsChecked) { New-Item "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Force | Out-Null; Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Name "PowerThrottlingOff" -Value 1 -ErrorAction SilentlyContinue }
    if ($K_SvcSplit.IsChecked)   {
        $ramKB = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1KB)
        Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Value $ramKB -ErrorAction SilentlyContinue
    }
    if ($K_NoSysMain.IsChecked)  { Stop-Service "SysMain" -Force -ErrorAction SilentlyContinue; Set-Service "SysMain" -StartupType Disabled -ErrorAction SilentlyContinue }
    if ($K_NoSearchIdx.IsChecked){ Stop-Service "WSearch" -Force -ErrorAction SilentlyContinue; Set-Service "WSearch" -StartupType Disabled -ErrorAction SilentlyContinue }
    if ($K_NoMemComp.IsChecked)  { Disable-MMAgent -MemoryCompression -ErrorAction SilentlyContinue }
    Write-Log "=== KERNEL & CPU OTTIMIZZATI! ===" 100
})

# --- 4. INTERFACCIA & ESPLORA FILE ---
$BtnUiAll.Add_Click({ @($U_FastMenu,$U_ShowExt,$U_ThisPC,$U_ClassicCtx,$U_TaskbarLeft,$U_HideTaskView,$U_NoAnim,$U_ShowHidden,$U_RestartExp) | ForEach-Object { $_.IsChecked = $true } })
$BtnUiNone.Add_Click({ @($U_FastMenu,$U_ShowExt,$U_ThisPC,$U_ClassicCtx,$U_TaskbarLeft,$U_HideTaskView,$U_NoAnim,$U_ShowHidden,$U_RestartExp) | ForEach-Object { $_.IsChecked = $false } })

$BtnRunUI.Add_Click({
    $TxtLog.Clear(); Create-SafetyBackup
    Write-Log "=== APPLICAZIONE INTERFACCIA & EXPLORER ===" 20
    if ($U_FastMenu.IsChecked)    { Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value "0" -ErrorAction SilentlyContinue }
    if ($U_ShowExt.IsChecked)     { Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 -ErrorAction SilentlyContinue }
    if ($U_ThisPC.IsChecked)      { Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1 -ErrorAction SilentlyContinue }
    if ($U_ClassicCtx.IsChecked)  { New-Item "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" -Force | Out-Null; Set-ItemProperty "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" -Name "(Default)" -Value "" -ErrorAction SilentlyContinue }
    if ($U_TaskbarLeft.IsChecked) { Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value 0 -ErrorAction SilentlyContinue }
    if ($U_HideTaskView.IsChecked){ Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0 -ErrorAction SilentlyContinue; Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarMn" -Value 0 -ErrorAction SilentlyContinue }
    if ($U_NoAnim.IsChecked)      { Set-ItemProperty "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "0" -ErrorAction SilentlyContinue }
    if ($U_ShowHidden.IsChecked)  { Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1 -ErrorAction SilentlyContinue }
    if ($U_RestartExp.IsChecked)  { Stop-Process -Name "explorer" -Force -ErrorAction SilentlyContinue }
    Write-Log "=== INTERFACCIA PERSONALIZZATA! ===" 100
})

# --- 5. RETE & DNS ---
$BtnRunNet.Add_Click({
    $TxtLog.Clear()
    Write-Log "=== OTTIMIZZAZIONE RETE TCP/IP ===" 25
    if ($N_TcpAuto.IsChecked)  { netsh int tcp set global autotuninglevel=normal | Out-Null; netsh int tcp set global rss=enabled | Out-Null }
    if ($N_NoQos.IsChecked)    { New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" -Force | Out-Null; Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" -Name "NonBestEffortLimit" -Value 0 -ErrorAction SilentlyContinue }
    if ($N_NoNagle.IsChecked)  {
        Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" | ForEach-Object {
            Set-ItemProperty $_.PSPath -Name "TcpAckFrequency" -Value 1 -ErrorAction SilentlyContinue
            Set-ItemProperty $_.PSPath -Name "TCPNoDelay" -Value 1 -ErrorAction SilentlyContinue
        }
    }
    if ($N_NicPower.IsChecked) { Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | ForEach-Object { Disable-NetAdapterPowerManagement -Name $_.Name -ErrorAction SilentlyContinue } }
    if ($N_Flush.IsChecked)    { ipconfig /flushdns | Out-Null }
    Write-Log "=== RETE OTTIMIZZATA! ===" 100
})

function Set-ActiveDns($dnsServers) {
    Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | ForEach-Object {
        if ($null -eq $dnsServers) { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ResetServerAddresses }
        else { Set-DnsClientServerAddress -InterfaceIndex $_.ifIndex -ServerAddresses $dnsServers }
    }
    ipconfig /flushdns | Out-Null
}
$BtnDnsCloudflare.Add_Click({ Set-ActiveDns @("1.1.1.1","1.0.0.1"); Write-Log "[DNS] Impostato Cloudflare (1.1.1.1 / 1.0.0.1)!" 100 })
$BtnDnsGoogle.Add_Click({ Set-ActiveDns @("8.8.8.8","8.8.4.4"); Write-Log "[DNS] Impostato Google DNS (8.8.8.8 / 8.8.4.4)!" 100 })
$BtnDnsQuad9.Add_Click({ Set-ActiveDns @("9.9.9.9","149.112.112.112"); Write-Log "[DNS] Impostato Quad9 Sicuro (9.9.9.9)!" 100 })
$BtnDnsAuto.Add_Click({ Set-ActiveDns $null; Write-Log "[DNS] Ripristinati DNS Automatici DHCP!" 100 })

# --- 6. PRIVACY & DEBLOAT ---
$BtnPrivAll.Add_Click({ @($R_NoAds,$R_Telemetry,$R_StopDiag,$R_Bing,$R_AdId,$R_BgApps,$R_Widgets,$R_Copilot,$R_OneDrive) | ForEach-Object { $_.IsChecked = $true } })
$BtnPrivNone.Add_Click({ @($R_NoAds,$R_Telemetry,$R_StopDiag,$R_Bing,$R_AdId,$R_BgApps,$R_Widgets,$R_Copilot,$R_OneDrive) | ForEach-Object { $_.IsChecked = $false } })

$BtnRunPrivacy.Add_Click({
    $TxtLog.Clear(); Create-SafetyBackup
    Write-Log "=== PROTEZIONE PRIVACY & CONTROLLO AI ===" 20
    if ($R_NoAds.IsChecked) {
        New-Item "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Force | Out-Null
        @("SubscribedContent-338388Enabled","SubscribedContent-338389Enabled","SubscribedContent-338393Enabled","SubscribedContent-353694Enabled","SubscribedContent-353696Enabled","SystemPaneSuggestionsEnabled") | ForEach-Object {
            Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name $_ -Value 0 -ErrorAction SilentlyContinue
        }
    }
    if ($R_Telemetry.IsChecked) { New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Force | Out-Null; Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue }
    if ($R_StopDiag.IsChecked)  { @("DiagTrack","dmwappushservice") | ForEach-Object { Stop-Service $_ -Force -ErrorAction SilentlyContinue; Set-Service $_ -StartupType Disabled -ErrorAction SilentlyContinue } }
    if ($R_Bing.IsChecked)      { New-Item "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Force | Out-Null; Set-ItemProperty "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -Value 1 -ErrorAction SilentlyContinue }
    if ($R_AdId.IsChecked)      {
        New-Item "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Force | Out-Null
        Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -ErrorAction SilentlyContinue
        New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Force | Out-Null
        Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Value 0 -ErrorAction SilentlyContinue
    }
    if ($R_BgApps.IsChecked)    { New-Item "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Force | Out-Null; Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name "GlobalUserDisabled" -Value 1 -ErrorAction SilentlyContinue }
    if ($R_Widgets.IsChecked)   { New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Dsh" -Force | Out-Null; Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Dsh" -Name "AllowNewsAndInterests" -Value 0 -ErrorAction SilentlyContinue }
    if ($R_Copilot.IsChecked)   {
        New-Item "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot" -Force | Out-Null
        Set-ItemProperty "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot" -Name "TurnOffWindowsCopilot" -Value 1 -ErrorAction SilentlyContinue
        New-Item "HKCU:\Software\Policies\Microsoft\Windows\WindowsAI" -Force | Out-Null
        Set-ItemProperty "HKCU:\Software\Policies\Microsoft\Windows\WindowsAI" -Name "DisableAIDataAnalysis" -Value 1 -ErrorAction SilentlyContinue
    }
    if ($R_OneDrive.IsChecked)  { Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue; $od = "$env:SystemRoot\SysWOW64\OneDriveSetup.exe"; if (Test-Path $od) { Start-Process $od "/uninstall" -Wait -WindowStyle Hidden } }
    Write-Log "=== PRIVACY APPLICATA CON SUCCESSO! ===" 100
})

# --- 7. GESTORE APP & AVVIO ---
function Load-AppsAndStartup {
    $LstBloatApps.Items.Clear()
    $targets = @("Microsoft.BingNews","Microsoft.BingWeather","Microsoft.GetHelp","Microsoft.Getstarted","Microsoft.MicrosoftSolitaireCollection","Microsoft.People","Microsoft.Todos","Microsoft.ZuneMusic","Microsoft.ZuneVideo","Clipchamp.Clipchamp","Microsoft.549981C3F5F10","MicrosoftTeams")
    $installed = Get-AppxPackage -AllUsers | Where-Object { $targets -contains $_.Name }
    foreach ($app in $installed) {
        $cb = New-Object System.Windows.Controls.CheckBox
        $cb.Content = "$($app.Name)"; $cb.Tag = $app.Name; $cb.FontSize = 12.5; $cb.Margin = "2,3"
        $LstBloatApps.Items.Add($cb) | Out-Null
    }
    if ($LstBloatApps.Items.Count -eq 0) { $LstBloatApps.Items.Add("Nessun bloatware preinstallato trovato.") | Out-Null }

    $LstStartup.Items.Clear()
    $runKeys = Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -ErrorAction SilentlyContinue
    if ($runKeys) {
        $runKeys.PSObject.Properties | Where-Object { $_.Name -notlike "PS*" } | ForEach-Object {
            $cb = New-Object System.Windows.Controls.CheckBox
            $cb.Content = "$($_.Name)"; $cb.Tag = $_.Name; $cb.FontSize = 12.5; $cb.Margin = "2,3"
            $LstStartup.Items.Add($cb) | Out-Null
        }
    }
}

$BtnRemoveSelectedApps.Add_Click({
    $count = 0
    foreach ($item in $LstBloatApps.Items) {
        if ($item -is [System.Windows.Controls.CheckBox] -and $item.IsChecked) {
            Get-AppxPackage -Name $item.Tag -AllUsers -ErrorAction SilentlyContinue | Remove-AppxPackage -ErrorAction SilentlyContinue
            $count++
        }
    }
    Load-AppsAndStartup
    Write-Log "[DEBLOAT] Rimosse $count app selezionate." 100
})

$BtnRemoveStartup.Add_Click({
    $count = 0
    foreach ($item in $LstStartup.Items) {
        if ($item -is [System.Windows.Controls.CheckBox] -and $item.IsChecked) {
            Remove-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name $item.Tag -ErrorAction SilentlyContinue
            $count++
        }
    }
    Load-AppsAndStartup
    Write-Log "[AVVIO] Rimossi $count programmi dall'avvio automatico." 100
})

# --- 8. GAMING PRO (SEPARATO) ---
$BtnRunGaming.Add_Click({
    $TxtLog.Clear(); Create-SafetyBackup
    Write-Log "=== ATTIVAZIONE PROFILO GAMING PRO ===" 25
    if ($G_GameMode.IsChecked) { New-Item "HKCU:\Software\Microsoft\GameBar" -Force | Out-Null; Set-ItemProperty "HKCU:\Software\Microsoft\GameBar" -Name "AutoGameModeEnabled" -Value 1 -ErrorAction SilentlyContinue; Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -ErrorAction SilentlyContinue }
    if ($G_NoDvr.IsChecked)    { Set-ItemProperty "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 0 -ErrorAction SilentlyContinue; New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Force | Out-Null; Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Value 0 -ErrorAction SilentlyContinue }
    if ($G_Mmcss.IsChecked)    {
        $gPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games"
        New-Item $gPath -Force | Out-Null
        Set-ItemProperty $gPath -Name "GPU Priority" -Value 8 -ErrorAction SilentlyContinue
        Set-ItemProperty $gPath -Name "Priority" -Value 6 -ErrorAction SilentlyContinue
        Set-ItemProperty $gPath -Name "Scheduling Category" -Value "High" -ErrorAction SilentlyContinue
    }
    if ($G_Mouse.IsChecked)    { Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value "0" -ErrorAction SilentlyContinue; Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value "0" -ErrorAction SilentlyContinue; Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value "0" -ErrorAction SilentlyContinue }
    if ($G_NoFso.IsChecked)    { Set-ItemProperty "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehaviorMode" -Value 2 -ErrorAction SilentlyContinue }
    if ($G_Shaders.IsChecked)  { Remove-Item "$env:LOCALAPPDATA\D3DSCache\*" -Recurse -Force -ErrorAction SilentlyContinue }
    Write-Log "=== PROFILO GAMING PRO ATTIVATO! ===" 100
})

$BtnDisableGaming.Add_Click({
    $TxtLog.Clear()
    Set-ItemProperty "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 1 -ErrorAction SilentlyContinue
    Set-ItemProperty "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehaviorMode" -Value 0 -ErrorAction SilentlyContinue
    Remove-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Recurse -Force -ErrorAction SilentlyContinue
    Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value "1" -ErrorAction SilentlyContinue
    Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value "6" -ErrorAction SilentlyContinue
    Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value "10" -ErrorAction SilentlyContinue
    Write-Log "=== PROFILO GAMING DISATTIVATO (Valori standard ripristinati) ===" 100
})

# --- 9. TORNA INDIETRO & RIPARAZIONE ---
$BtnRestoreLastBackup.Add_Click({
    $TxtLog.Clear()
    $latestFile = Join-Path $BackupDir "latest.txt"
    if (Test-Path $latestFile) {
        $lastDir = (Get-Content $latestFile -Raw).Trim()
        if (Test-Path $lastDir) {
            Write-Log "=== RIPRISTINO ULTIMO BACKUP REGISTRO ===" 40
            Get-ChildItem $lastDir -Filter "*.reg" | ForEach-Object { reg import $_.FullName | Out-Null }
            Write-Log "=== BACKUP RIPRISTINATO! Riavvia il PC per applicare tutto. ===" 100
            [System.Windows.MessageBox]::Show("Impostazioni riportate allo stato precedente all'ultima modifica!", "Easy11 - Ripristino", "OK", "Information")
            return
        }
    }
    Write-Log "[INFO] Nessun backup precedente trovato." 0
})

$BtnUndoUiPrivacy.Add_Click({
    $TxtLog.Clear()
    Set-ItemProperty "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value "400" -ErrorAction SilentlyContinue
    Set-ItemProperty "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "1" -ErrorAction SilentlyContinue
    Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value 1 -ErrorAction SilentlyContinue
    Remove-Item "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "HKLM:\SOFTWARE\Policies\Microsoft\Dsh" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "HKCU:\Software\Policies\Microsoft\Windows\WindowsAI" -Recurse -Force -ErrorAction SilentlyContinue
    Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name "GlobalUserDisabled" -Value 0 -ErrorAction SilentlyContinue
    Stop-Process -Name "explorer" -Force -ErrorAction SilentlyContinue
    Write-Log "=== UI & PRIVACY RIPRISTINATE AI VALORI ORIGINALI ===" 100
})

$BtnUndoPowerNet.Add_Click({
    $TxtLog.Clear()
    powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e | Out-Null
    powercfg -h on | Out-Null
    @("WSearch","SysMain","DiagTrack") | ForEach-Object { Set-Service $_ -StartupType Automatic -ErrorAction SilentlyContinue; Start-Service $_ -ErrorAction SilentlyContinue }
    Enable-MMAgent -MemoryCompression -ErrorAction SilentlyContinue
    Set-ActiveDns $null
    Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 2 -ErrorAction SilentlyContinue
    Write-Log "=== KERNEL, SERVIZI, RETE & DNS RIPRISTINATI ===" 100
})

$BtnRepairDismSfc.Add_Click({
    $TxtLog.Clear()
    Write-Log "[1/2] Avvio DISM RestoreHealth (attendere alcuni minuti)..." 30
    Start-Process "dism.exe" "/Online /Cleanup-Image /RestoreHealth" -Wait -WindowStyle Hidden
    Write-Log "[2/2] Avvio SFC /scannow..." 70
    Start-Process "sfc.exe" "/scannow" -Wait -WindowStyle Hidden
    Write-Log "=== RIPARAZIONE INTEGRITA FILE WINDOWS COMPLETATA ===" 100
})

$BtnOpenSysRestore.Add_Click({ Start-Process "rstrui.exe" })

[void]$window.ShowDialog()