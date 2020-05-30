$METAURL = "http://169.254.169.254/latest"


function is_ec2 { 
  $UUID = Get-WmiObject -query "select uuid from Win32_ComputerSystemProduct" | Select -ExpandProperty UUID  | Out-String
  
  if ($UUID.Substring(0,3) -ne "EC2") {
    return $False    
  }

  $MetaEndpoint = Invoke-webRequest -Uri $METAURL
  return $MetaEndpoint.StatusCode  -eq "200"

  }

function dataparse([STRING]$url,[STRING]$k) {
   
    $request = Invoke-WebRequest  -Uri $url/$k
    $data = $request.Content
    if ($request.StatusCode -eq "404") {
        write-Host "404 not found"
        return
    }
    $object = [PSObject]@{ }
    foreach ($key in $data.Split("`n")) {
   

        if ($key -eq "rsa2048", "pkcs7", "signature", "security-credentials/", "user-data" ) {
            write-Host "Key match"
            continue
        }


       
       $newurl = "$url/$k"

        if ($key.EndsWith("/")) { 
            $newkey = $key.Substring(0,$key.Length-1)
            $data = dataparse $newurl $newkey

             $object.Add("$newkey",$data)     
            
        }

        else {
        try {
            $request = Invoke-WebRequest  -Uri $newurl/$key
            $data = $request.Content
                $StatusCode = $Response.StatusCode
} catch {
    $StatusCode = $_.Exception.Response.StatusCode.value__
}
            if ($request.StatusCode -ne "404") {
             $object.add($key.trim(),$data)
            }  
        
        }


    }
    return $object

}


  
function load { 

$KeyList = "meta-data"
$metadict = [PSObject]@{}

 


foreach($key in $KeyList){
 $prefix = "AWS"

 $result = dataparse $METAURL $key
 $metadict["$prefix-$key"] = $result
}



return $metadict | ConvertTo-Json -Depth 20


}



if (is_ec2) {
load

}
