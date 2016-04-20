newman -c ShopSmartCustomer_Final.json -p -O OUT_ShopSmartCustomer_$(date +%Y%m%d-%H%M%S).json
newman -c ShopSmartAdmin_Final.json -p -O OUT_ShopSmartAdmin_$(date +%Y%m%d-%H%M%S).json

#newman -c ShopSmartCustomer_Final.json -n 5 -p -O OUT_ShopSmartCustomer_Final.json
#newman -c ShopSmartAdmin_Final.json -n 5 -p -O OUT_ShopSmartAdmin_Final.json
