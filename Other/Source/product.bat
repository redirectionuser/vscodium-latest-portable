@echo off

@setlocal
  set "curl_binary=%WINDIR%\system32\curl.exe"
  set "yq_binary=%~dp0yq.exe"
  set "product_json=%~dp0..\..\App\VSCodiumLatest\resources\app\product.json"
  set "product_extensionsGallery_json=%~dp0product_extensionsGallery.json"
  if not exist %yq_binary% if exist %curl_binary% (
    %curl_binary% -Lo %yq_binary% https://github.com/mikefarah/yq/releases/latest/download/yq_windows_386.exe
  )
  if exist %yq_binary% if exist %curl_binary% (
    %curl_binary% -Lo "%product_extensionsGallery_json%" https://main--dancing-flan-0a81d3.netlify.app/.netlify/functions/latest-vscodium-product-json--extensionsGallery
    %yq_binary% ea -oj -i ". as $item ireduce ({}; . * $item )" "%product_json%" "%product_extensionsGallery_json%"
    del %yq_binary% %product_extensionsGallery_json%"
  )
@endlocal
