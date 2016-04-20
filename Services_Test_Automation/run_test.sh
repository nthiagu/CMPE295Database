newman -c ShopSmartCustomer_Final.json -p -O OUT_ShopSmartCustomer_$(date +%Y%m%d-%H%M%S).json
newman -c ShopSmartAdmin_Final.json -p -O OUT_ShopSmartAdmin_$(date +%Y%m%d-%H%M%S).json
