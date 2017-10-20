# MERALCO DataPower XSLTs
## Getting Started
### Prerequisites
You would need the following:
1. XML Editor like Notepad++
2. Web browser for DataPower console

___

### Instructions for RouteToQ.xsl
1. Clone the repository.
2. Edit `RouteToQ.xsl`, and change the parameters according to the IP address and ports of the MQ Queue Managers.
3. Upload `RouteToQ.xsl` and `lookup.xml` to DataPower. They should be residing on the same directory.

#### Note: To edit `lookup.xml`, you need to change the `name` attribute according to the `noun` element of the request message. The queue name is mapped against the `name` attribute of the `noun` element in the `lookup.xml` file.

---

### Example of lookup.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<nouns>
	<noun name='TransformerLevelEvents'><queue>SODMS.CTLE.MDM.OUT</queue></noun>
	<noun name='InputKeyHere'><queue>PUT.DESTINATION.QUEUE.HERE</queue></noun>
</nouns>
```

---
### Instructions for http-dynamic.xsl
1. Clone the repository.
2. Edit `http-endpoint.xml`, and change the parameters according to the IP address and port of the destination server.
3. Edit `http-lookup.xml`, and change the parameters according to the endpoint URLs required by MERALCO.
4. Upload `http-dynamic.xsl`, `http-endpoint.xml` and `http-lookup.xml` to DataPower. They should be residing on the same directory.

---
### Example of http-lookup.xml

```
<?xml version="1.0" encoding="UTF-8"?>
<?xml version="1.0" encoding="UTF-8"?>

<paths>
  <path key="/Customer/OnlineServiceApplication/ContractFinalized">http://10.80.16.109:7803/Customer/OnlineServiceApplication/ContractFinalized</path>
  <path key="/Customer/OnlineServiceApplication/Energized">http://10.80.16.109:7803/Customer/OnlineServiceApplication/Energized</path>
  <path key="/Customer/OnlineServiceApplication/UpdateCase">http://10.80.16.109:7803/Customer/OnlineServiceApplication/UpdateCase</path>
  <path key="/Customer/OnlineServiceApplication/Retired">http://10.80.16.109:7803/Customer/OnlineServiceApplication/Retired</path>
  <path key="/Customer/OnlineServiceApplication/ContractTerminated">http://10.80.16.109:7803/Customer/OnlineServiceApplication/ContractTerminated</path>
  <path key="/Customer/OnlineServiceApplication/ServiceUpdate">http://10.80.16.109:7803/Customer/OnlineServiceApplication/ServiceUpdate</path>
  <path key="/Customer/OnlineServiceApplication/ApplicationApproved">http://LBG_Customer/Customer/OnlineServiceApplication/ApplicationApproved</path>
  <path key="/Customer/OnlineServiceApplication/ReinspectionRemarks">http://LBG_Customer/Customer/OnlineServiceApplication/ReinspectionRemarks</path>
  <path key="/Customer/OnlineServiceApplication/GetServiceDetails">http://LBG_Customer/Customer/OnlineServiceApplication/GetServiceDetails</path>
  <path key="/Customer/Billing/UpdateBillPrintMode">http://LBG_Customer/Customer/Billing/UpdateBillPrintMode</path>
  <path key="/Customer/iPay/OnlinePayments">http://LBG_Customer/Customer/iPay/OnlinePayments</path>
</paths>
```
