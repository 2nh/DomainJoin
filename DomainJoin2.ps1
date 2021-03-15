function Generate_Form($formType, $compName){
    $ComboBox1 = (New-Object -TypeName System.Windows.Forms.ComboBox) 
    $ComboBox2 = (New-Object -TypeName System.Windows.Forms.ComboBox)
    $PictureBox1 = (New-Object -TypeName System.Windows.Forms.PictureBox)
    $Label1 = (New-Object -TypeName System.Windows.Forms.Label)
    $Button1 = (New-Object -TypeName System.Windows.Forms.Button)
    $Button2 = (New-Object -TypeName System.Windows.Forms.Button)
    $TextBox1 = (New-Object -TypeName System.Windows.Forms.TextBox)
    ([System.ComponentModel.ISupportInitialize]$PictureBox1).BeginInit()



    ######## IMAGE FILE PATHS
    $Form_Icon = New-Object system.drawing.icon('C:\Users\nhamilton\Desktop\OAGIcon.ico')
    $PictureBox_Image = [Drawing.Image]::FromFile('C:\Users\nhamilton\Desktop\OAGLogo.png')
    #########################


    $Form1.SuspendLayout()
    #
    #TextBox
    #
    $TextBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]46,[System.Int32]184))
    $TextBox1.Name = [System.String]'TextBox1'
    $TextBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]291,[System.Int32]21))
    $TextBox1.TabIndex = [System.Int32]0
    $TextBox1.Visible = $false
    $TextBox1.MaxLength = [System.Int32]5
    #
    #ComboBoxes
    #
    $ComboBox1.FormattingEnabled = $true
    $ComboBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]46,[System.Int32]184))
    $ComboBox1.Name = [System.String]'ComboBox1'
    $ComboBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]291,[System.Int32]21))
    $ComboBox1.add_SelectedIndexChanged($ComboBox1_SelectedIndexChanged)
    $ComboBox1.DropDownStyle = 'DropDownList'

    $ComboBox2.FormattingEnabled = $true
    $ComboBox2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]46,[System.Int32]224))
    $ComboBox2.Name = [System.String]'ComboBox2'
    $ComboBox2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]291,[System.Int32]21))
    $ComboBox2.add_SelectedIndexChanged($ComboBox2_SelectedIndexChanged)
    $ComboBox2.DropDownStyle = 'DropDownList'

    $Selection_List = @("Accounting","Corporate Executive","Corporate HR","CDJ Parts","CDJ Sales","CDJ Service","OCC Office","OCC Parts","OCC Service","Call Center","FLM Parts","FLM Sales","FLM Service","HYU Parts","HYU Sales","HYU Service","MAZ Detail","MAZ Parts","MAZ Sales","MAZ Service","TOY Parts","TOY Sales","TOY Service")
    $Function_List = @("Desktop","Laptop","Tablet","Server","Access Point","Virtual Machine")
    $Platform_List = @("Windows 10", "Windows Server 2019","Windows Server 2012","Windows Server 2008","Linux","MacOS")

    
    # Determining what needs to be displayed.
    switch($formType){
        1{foreach($item in $Selection_List){$ComboBox1.Items.Add($item) | Out-Null} $ComboBox2.Visible = $false}
        2{$ComboBox1.Items.Clear(); foreach($item in $Function_List){$ComboBox1.Items.Add($item) | Out-Null} $ComboBox2.Visible = $true; foreach($item in $Platform_List){$ComboBox2.Items.Add($item) | Out-Null}}
        3{$ComboBox1.Visible = $false; $ComboBox2.Visible = $false; $TextBox1.Visible = $true}
    }

    #
    #PictureBox1
    #
    $PictureBox1.BackgroundImage = $PictureBox_Image
    $PictureBox1.BackgroundImageLayout = [System.Windows.Forms.ImageLayout]::Stretch
    $PictureBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]12))
    $PictureBox1.Name = [System.String]'PictureBox1'
    $PictureBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]348,[System.Int32]119))
    $PictureBox1.TabIndex = [System.Int32]1
    $PictureBox1.TabStop = $false
    #
    #Label1
    #
    $Label1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Times New Roman',[System.Single]12,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
    $Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]46,[System.Int32]160))
    $Label1.Name = [System.String]'Label1'
    $Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]243,[System.Int32]21))
    $Label1.TabIndex = [System.Int32]2
    switch($formType){
        1{$Label1.Text = [System.String]"Select Store/Department:"}
        2{$Label1.Text = [System.String]"Select Function/Platform:"}
        3{$Label1.Text = [System.String]"Enter Asset Tag for "+$compName+":"}
    }
    

    $Label1.UseCompatibleTextRendering = $true
    $Label1.add_Click($Label1_Click)
    #
    #Button1
    #
    $Button1.BackColor = [System.Drawing.Color]::DodgerBlue
    $Button1.ForeColor = [System.Drawing.Color]::White
    $Button1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]262,[System.Int32]273))
    $Button1.Name = [System.String]'Button1'
    $Button1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
    $Button1.TabIndex = [System.Int32]3
    $Button1.Text = [System.String]'Next'
    $Button1.UseCompatibleTextRendering = $true
    $Button1.UseVisualStyleBackColor = $false
    $Button1.Add_Click({$Form1.Close() | Out-NUll})

    #
    #Button2
    #
    $Button2.BackColor = [System.Drawing.Color]::Crimson
    $Button2.ForeColor = [System.Drawing.Color]::White
    $Button2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]46,[System.Int32]273))
    $Button2.Name = [System.String]'Button2'
    $Button2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
    $Button2.TabIndex = [System.Int32]4
    $Button2.Text = [System.String]'Exit'
    $Button2.UseCompatibleTextRendering = $true
    $Button2.UseVisualStyleBackColor = $false
    $Button2.Add_Click({$Form1.Close()})
    #
    #Form1
    #
    

    $Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]378,[System.Int32]326))
    $Form1.Icon = $Form_Icon
    $Form1.Location.X = 10
    $Form1.Location.Y = 22
    $Form1.Controls.Add($Button2)
    $Form1.Controls.Add($Button1)
    $Form1.Controls.Add($Label1)
    $Form1.Controls.Add($PictureBox1)
    $Form1.Controls.Add($ComboBox1)
    $Form1.Controls.Add($ComboBox2)
    $Form1.Controls.Add($TextBox1)
    switch($formType){
        1{$ComboBox1.SelectedIndex = [System.Int32]0}
        2{$ComboBox1.SelectedIndex = [System.Int32]0; $ComboBox2.SelectedIndex = [System.Int32]0}
    }
    $Form1.Text = [System.String]'Form1'
    ([System.ComponentModel.ISupportInitialize]$PictureBox1).EndInit()
    $Form1.ResumeLayout($false)
    Add-Member -InputObject $Form1 -Name base -Value $base -MemberType NoteProperty -Force
    Add-Member -InputObject $Form1 -Name ComboBox1 -Value $ComboBox1 -MemberType NoteProperty -Force
    Add-Member -InputObject $Form1 -Name ComboBox2 -Value $ComboBox1 -MemberType NoteProperty -Force
    Add-Member -InputObject $Form1 -Name PictureBox1 -Value $PictureBox1 -MemberType NoteProperty -Force
    Add-Member -InputObject $Form1 -Name Label1 -Value $Label1 -MemberType NoteProperty -Force
    Add-Member -InputObject $Form1 -Name Button1 -Value $Button1 -MemberType NoteProperty -Force
    Add-Member -InputObject $Form1 -Name Button2 -Value $Button2 -MemberType NoteProperty -Force
    Add-Member -InputObject $Form1 -Name TextBox1 -Value $TextBox1 -MemberType NoteProperty -Force

    $Form1.ShowDialog() | Out-Null

    # Determining what to return
    $return = @()
    switch($formType){
        1{$return += $ComboBox1.SelectedIndex}
        2{$return += $ComboBox1.SelectedIndex; $return += $ComboBox2.SelectedIndex}
        3{$return += $TextBox1.Text.ToString()}
    }
    return $return
}

function Domain_Join($OU, $compName){
    $DomainToJoin = "" # DOMAIN NAME HERE
    
    Add-Computer -DomainName $DomainToJoin -OUPath $OU -NewName $compName -Restart
}



$OUPaths = @("") # CUSTOM OU PATHS HERE

# CUSTOM FIELDS
$CPNames = @("OAGA","OAGE","OAGH","CDJP","CDJS","CDJV","OCCO","OCCP","OCCV","FLMC","FLMP","FLMS","FLMV","FLMS","HYUP","HYUS","HYUV","MAZD","MAZP","MAZS","MAZV","TOYP","TOYS","TOYV")
$FNames = @("D","L","T","S","A","Z")
$PNames = @("X","S","T","E","L","A")

    $Form1 = New-Object -TypeName System.Windows.Forms.Form
    [System.Windows.Forms.ComboBox]$ComboBox1 = $null
    [System.Windows.Forms.ComboBox]$ComboBox2 = $null
    [System.Windows.Forms.PictureBox]$PictureBox1 = $null
    [System.Windows.Forms.Label]$Label1 = $null
    [System.Windows.Forms.Button]$Button1 = $null
    [System.Windows.Forms.Button]$Button2 = $null
    [System.Windows.Forms.Button]$TextBox1 = $null

$ComputerName = ""
$Selection = Generate_Form 1, $ComputerName
$SelectedOUPath = $OUPaths[$Selection[0]]
$ComputerName = $CPNames[$Selection[0]]

    $Form1 = New-Object -TypeName System.Windows.Forms.Form
    [System.Windows.Forms.ComboBox]$ComboBox1 = $null
    [System.Windows.Forms.ComboBox]$ComboBox2 = $null
    [System.Windows.Forms.PictureBox]$PictureBox1 = $null
    [System.Windows.Forms.Label]$Label1 = $null
    [System.Windows.Forms.Button]$Button1 = $null
    [System.Windows.Forms.Button]$Button2 = $null
    [System.Windows.Forms.Button]$TextBox1 = $null

$Selection = Generate_Form 2 $ComputerName
$SelectedFandP = $FNames[$Selection[0]]
$SelectedFandP = $SelectedFandP + $PNames[$Selection[1]]
$ComputerName = $ComputerName + $SelectedFandP

    $Form1 = New-Object -TypeName System.Windows.Forms.Form
    [System.Windows.Forms.ComboBox]$ComboBox1 = $null
    [System.Windows.Forms.ComboBox]$ComboBox2 = $null
    [System.Windows.Forms.PictureBox]$PictureBox1 = $null
    [System.Windows.Forms.Label]$Label1 = $null
    [System.Windows.Forms.Button]$Button1 = $null
    [System.Windows.Forms.Button]$Button2 = $null
    [System.Windows.Forms.Button]$TextBox1 = $null

$Selection = Generate_Form 3 $ComputerName
$SelectedTag = $Selection
$ComputerName = $ComputerName + $SelectedTag

Domain_Join $SelectedOUPath $ComputerName
Write-Output $ComputerName
