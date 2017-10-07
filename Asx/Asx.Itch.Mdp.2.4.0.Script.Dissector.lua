-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Asx Itch Mdp 2.4.0 Protocol
local asx_itch_mdp_2_4_0 = Proto("Asx.Itch.Mdp.2.4.0.Lua", "Asx Itch Mdp 2.4.0")

-- Component Tables
local show = {}
local display = {}
local dissect = {}
local calculate = {}
local verify = {}

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Asx Itch Mdp 2.4.0 Element Dissection Options
show.ad_hoc_text_message = true
show.anomalous_order_threshold_publish = true
show.custom_market_executed = true
show.custom_market_order_added = true
show.custom_market_order_deleted = true
show.custom_market_order_replaced = true
show.custom_market_trade = true
show.equilibrium_price_auction_info = true
show.future_symbol_directory = true
show.implied_order_added = true
show.implied_order_deleted = true
show.implied_order_replaced = true
show.market_settlement = true
show.market_updates = true
show.message = true
show.message_header = true
show.open__high__low__last_trade_adjustment = true
show.option_symbol_directory = true
show.order_added = true
show.order_book_state = true
show.order_deleted = true
show.order_executed = true
show.order_executed_with_price = true
show.order_replaced = true
show.order_volume_cancelled = true
show.packet = true
show.packet_header = true
show.request_for_quote = true
show.session = true
show.spread_executed = true
show.spread_symbol_directory = true
show.system_event = true
show.time_message = true
show.trade_cancellation = true
show.trade_spread_execution_chain = true
show.volume_and_open_interest = true
show.payload = true

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Asx Itch Mdp 2.4.0 Fields
asx_itch_mdp_2_4_0.fields.activated = ProtoField.new("Activated", "Asx.Itch.Mdp.activated", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.ad_hoc_text_message = ProtoField.new("Ad Hoc Text Message", "Asx.Itch.Mdp.adhoctextmessage", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.anomalous_order_threshold_publish = ProtoField.new("Anomalous Order Threshold Publish", "Asx.Itch.Mdp.anomalousorderthresholdpublish", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.aot_lower_price = ProtoField.new("AOT Lower Price", "Asx.Itch.Mdp.aotlowerprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.aot_price = ProtoField.new("AOT Price", "Asx.Itch.Mdp.aotprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.aot_upper_price = ProtoField.new("AOT Upper Price", "Asx.Itch.Mdp.aotupperprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.best_ask_price = ProtoField.new("Best Ask Price", "Asx.Itch.Mdp.bestaskprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.best_ask_quantity = ProtoField.new("Best Ask Quantity", "Asx.Itch.Mdp.bestaskquantity", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.best_bid_price = ProtoField.new("Best Bid Price", "Asx.Itch.Mdp.bestbidprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.best_bid_quantity = ProtoField.new("Best Bid Quantity", "Asx.Itch.Mdp.bestbidquantity", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.buyer = ProtoField.new("Buyer", "Asx.Itch.Mdp.buyer", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.buyer_order_number = ProtoField.new("Buyer Order Number", "Asx.Itch.Mdp.buyerordernumber", ftypes.UINT64)
asx_itch_mdp_2_4_0.fields.buyer_quantity_remaining = ProtoField.new("Buyer Quantity Remaining", "Asx.Itch.Mdp.buyerquantityremaining", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.buying_order_number = ProtoField.new("Buying Order Number", "Asx.Itch.Mdp.buyingordernumber", ftypes.UINT64)
asx_itch_mdp_2_4_0.fields.contract_number = ProtoField.new("Contract Number", "Asx.Itch.Mdp.contractnumber", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.contract_number_leg_1 = ProtoField.new("Contract Number Leg 1", "Asx.Itch.Mdp.contractnumberleg1", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.contract_number_leg_2 = ProtoField.new("Contract Number Leg 2", "Asx.Itch.Mdp.contractnumberleg2", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.contract_number_leg_3 = ProtoField.new("Contract Number Leg 3", "Asx.Itch.Mdp.contractnumberleg3", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.contract_number_leg_4 = ProtoField.new("Contract Number Leg 4", "Asx.Itch.Mdp.contractnumberleg4", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.contract_number_leg_5 = ProtoField.new("Contract Number Leg 5", "Asx.Itch.Mdp.contractnumberleg5", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.contract_number_leg_6 = ProtoField.new("Contract Number Leg 6", "Asx.Itch.Mdp.contractnumberleg6", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.contract_type = ProtoField.new("Contract Type", "Asx.Itch.Mdp.contracttype", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.count = ProtoField.new("Count", "Asx.Itch.Mdp.count", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.coupon_rate = ProtoField.new("Coupon Rate", "Asx.Itch.Mdp.couponrate", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.cumulative_volume = ProtoField.new("Cumulative Volume", "Asx.Itch.Mdp.cumulativevolume", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.currency = ProtoField.new("Currency", "Asx.Itch.Mdp.currency", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.custom_market_executed = ProtoField.new("Custom Market Executed", "Asx.Itch.Mdp.custommarketexecuted", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.custom_market_order_added = ProtoField.new("Custom Market Order Added", "Asx.Itch.Mdp.custommarketorderadded", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.custom_market_order_deleted = ProtoField.new("Custom Market Order Deleted", "Asx.Itch.Mdp.custommarketorderdeleted", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.custom_market_order_number = ProtoField.new("Custom Market Order Number", "Asx.Itch.Mdp.custommarketordernumber", ftypes.UINT64)
asx_itch_mdp_2_4_0.fields.custom_market_order_replaced = ProtoField.new("Custom Market Order Replaced", "Asx.Itch.Mdp.custommarketorderreplaced", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.custom_market_quantity_remaining = ProtoField.new("Custom Market Quantity Remaining", "Asx.Itch.Mdp.custommarketquantityremaining", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.custom_market_trade = ProtoField.new("Custom Market Trade", "Asx.Itch.Mdp.custommarkettrade", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.equilibrium_price = ProtoField.new("Equilibrium Price", "Asx.Itch.Mdp.equilibriumprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.equilibrium_price_auction_info = ProtoField.new("Equilibrium Price Auction Info", "Asx.Itch.Mdp.equilibriumpriceauctioninfo", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.etr_lower_price = ProtoField.new("ETR Lower Price", "Asx.Itch.Mdp.etrlowerprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.etr_price = ProtoField.new("ETR Price", "Asx.Itch.Mdp.etrprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.etr_upper_price = ProtoField.new("ETR Upper Price", "Asx.Itch.Mdp.etrupperprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.event_code = ProtoField.new("Event Code", "Asx.Itch.Mdp.eventcode", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.exchange = ProtoField.new("Exchange", "Asx.Itch.Mdp.exchange", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.executed_quantity = ProtoField.new("Executed Quantity", "Asx.Itch.Mdp.executedquantity", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.expiry_month = ProtoField.new("Expiry Month", "Asx.Itch.Mdp.expirymonth", ftypes.UINT8)
asx_itch_mdp_2_4_0.fields.expiry_year = ProtoField.new("Expiry Year", "Asx.Itch.Mdp.expiryyear", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.financial_type = ProtoField.new("Financial Type", "Asx.Itch.Mdp.financialtype", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.first_leg_contract_number = ProtoField.new("First Leg Contract Number", "Asx.Itch.Mdp.firstlegcontractnumber", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.future_symbol_directory = ProtoField.new("Future Symbol Directory", "Asx.Itch.Mdp.futuresymboldirectory", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.highest_trade = ProtoField.new("Highest Trade", "Asx.Itch.Mdp.highesttrade", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.highest_traded_price = ProtoField.new("Highest Traded Price", "Asx.Itch.Mdp.highesttradedprice", ftypes.UINT16, nil, base.DEC, "0x000008")
asx_itch_mdp_2_4_0.fields.implied_order_added = ProtoField.new("Implied Order Added", "Asx.Itch.Mdp.impliedorderadded", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.implied_order_deleted = ProtoField.new("Implied Order Deleted", "Asx.Itch.Mdp.impliedorderdeleted", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.implied_order_replaced = ProtoField.new("Implied Order Replaced", "Asx.Itch.Mdp.impliedorderreplaced", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.instrument = ProtoField.new("Instrument", "Asx.Itch.Mdp.instrument", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.last_trade = ProtoField.new("Last Trade", "Asx.Itch.Mdp.lasttrade", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.last_traded_price = ProtoField.new("Last Traded Price", "Asx.Itch.Mdp.lasttradedprice", ftypes.UINT16, nil, base.DEC, "0x000040")
asx_itch_mdp_2_4_0.fields.last_traded_volume = ProtoField.new("Last Traded Volume", "Asx.Itch.Mdp.lasttradedvolume", ftypes.UINT16, nil, base.DEC, "0x000080")
asx_itch_mdp_2_4_0.fields.last_trading_date = ProtoField.new("Last Trading Date", "Asx.Itch.Mdp.lasttradingdate", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.last_volume = ProtoField.new("Last Volume", "Asx.Itch.Mdp.lastvolume", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.legs = ProtoField.new("Legs", "Asx.Itch.Mdp.legs", ftypes.UINT8)
asx_itch_mdp_2_4_0.fields.length = ProtoField.new("Length", "Asx.Itch.Mdp.length", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.lot_size_or_face_value = ProtoField.new("Lot Size or Face Value", "Asx.Itch.Mdp.lotsizeorfacevalue", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.lowest_trade = ProtoField.new("Lowest Trade", "Asx.Itch.Mdp.lowesttrade", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.lowest_traded_price = ProtoField.new("Lowest Traded Price", "Asx.Itch.Mdp.lowesttradedprice", ftypes.UINT16, nil, base.DEC, "0x000010")
asx_itch_mdp_2_4_0.fields.market_settlement = ProtoField.new("Market Settlement", "Asx.Itch.Mdp.marketsettlement", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.market_updates = ProtoField.new("Market Updates", "Asx.Itch.Mdp.marketupdates", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.match_number = ProtoField.new("Match Number", "Asx.Itch.Mdp.matchnumber", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.maturity_value = ProtoField.new("Maturity Value", "Asx.Itch.Mdp.maturityvalue", ftypes.UINT8)
asx_itch_mdp_2_4_0.fields.message = ProtoField.new("Message", "Asx.Itch.Mdp.message", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.message_header = ProtoField.new("Message Header", "Asx.Itch.Mdp.messageheader", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.message_type = ProtoField.new("Message Type", "Asx.Itch.Mdp.messagetype", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.open_interest = ProtoField.new("Open Interest", "Asx.Itch.Mdp.openinterest", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.open__high__low__last_trade_adjustment = ProtoField.new("Open, High, Low, Last Trade Adjustment", "Asx.Itch.Mdp.openhighlowlasttradeadjustment", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.opening_trade = ProtoField.new("Opening Trade", "Asx.Itch.Mdp.openingtrade", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.opening_trade_price = ProtoField.new("Opening Trade Price", "Asx.Itch.Mdp.openingtradeprice", ftypes.UINT16, nil, base.DEC, "0x000004")
asx_itch_mdp_2_4_0.fields.option_symbol_directory = ProtoField.new("Option Symbol Directory", "Asx.Itch.Mdp.optionsymboldirectory", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.option_type = ProtoField.new("Option Type", "Asx.Itch.Mdp.optiontype", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.order_added = ProtoField.new("Order Added", "Asx.Itch.Mdp.orderadded", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.order_book_priority = ProtoField.new("Order Book Priority", "Asx.Itch.Mdp.orderbookpriority", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.order_book_state = ProtoField.new("Order Book State", "Asx.Itch.Mdp.orderbookstate", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.order_deleted = ProtoField.new("Order Deleted", "Asx.Itch.Mdp.orderdeleted", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.order_executed = ProtoField.new("Order Executed", "Asx.Itch.Mdp.orderexecuted", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.order_executed_with_price = ProtoField.new("Order Executed with Price", "Asx.Itch.Mdp.orderexecutedwithprice", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.order_number = ProtoField.new("Order Number", "Asx.Itch.Mdp.ordernumber", ftypes.UINT64)
asx_itch_mdp_2_4_0.fields.order_replaced = ProtoField.new("Order Replaced", "Asx.Itch.Mdp.orderreplaced", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.order_volume_cancelled = ProtoField.new("Order Volume Cancelled", "Asx.Itch.Mdp.ordervolumecancelled", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.packet = ProtoField.new("Packet", "Asx.Itch.Mdp.packet", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.packet_header = ProtoField.new("Packet Header", "Asx.Itch.Mdp.packetheader", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.payload = ProtoField.new("Payload", "Asx.Itch.Mdp.payload", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.payments_per_year = ProtoField.new("Payments per Year", "Asx.Itch.Mdp.paymentsperyear", ftypes.UINT8)
asx_itch_mdp_2_4_0.fields.price = ProtoField.new("Price", "Asx.Itch.Mdp.price", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.price_decimal_position = ProtoField.new("Price Decimal Position", "Asx.Itch.Mdp.pricedecimalposition", ftypes.UINT8)
asx_itch_mdp_2_4_0.fields.price_fractional_denominator = ProtoField.new("Price Fractional Denominator", "Asx.Itch.Mdp.pricefractionaldenominator", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.price_leg_1 = ProtoField.new("Price Leg 1", "Asx.Itch.Mdp.priceleg1", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.price_leg_2 = ProtoField.new("Price Leg 2", "Asx.Itch.Mdp.priceleg2", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.price_leg_3 = ProtoField.new("Price Leg 3", "Asx.Itch.Mdp.priceleg3", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.price_leg_4 = ProtoField.new("Price Leg 4", "Asx.Itch.Mdp.priceleg4", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.price_leg_5 = ProtoField.new("Price Leg 5", "Asx.Itch.Mdp.priceleg5", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.price_leg_6 = ProtoField.new("Price Leg 6", "Asx.Itch.Mdp.priceleg6", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.price_minimum_tick = ProtoField.new("Price Minimum Tick", "Asx.Itch.Mdp.priceminimumtick", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.primary_ratio = ProtoField.new("Primary Ratio", "Asx.Itch.Mdp.primaryratio", ftypes.UINT8)
asx_itch_mdp_2_4_0.fields.printable = ProtoField.new("Printable", "Asx.Itch.Mdp.printable", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.prior_day_settlement = ProtoField.new("Prior Day Settlement", "Asx.Itch.Mdp.priordaysettlement", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.protocol_version = ProtoField.new("Protocol Version", "Asx.Itch.Mdp.protocolversion", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.quantity = ProtoField.new("Quantity", "Asx.Itch.Mdp.quantity", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.quantity_remaining = ProtoField.new("Quantity Remaining", "Asx.Itch.Mdp.quantityremaining", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.ratio_leg_1 = ProtoField.new("Ratio Leg 1", "Asx.Itch.Mdp.ratioleg1", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.ratio_leg_2 = ProtoField.new("Ratio Leg 2", "Asx.Itch.Mdp.ratioleg2", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.ratio_leg_3 = ProtoField.new("Ratio Leg 3", "Asx.Itch.Mdp.ratioleg3", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.ratio_leg_4 = ProtoField.new("Ratio Leg 4", "Asx.Itch.Mdp.ratioleg4", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.ratio_leg_5 = ProtoField.new("Ratio Leg 5", "Asx.Itch.Mdp.ratioleg5", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.ratio_leg_6 = ProtoField.new("Ratio Leg 6", "Asx.Itch.Mdp.ratioleg6", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.request_for_quote = ProtoField.new("Request for Quote", "Asx.Itch.Mdp.requestforquote", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.reserved = ProtoField.new("Reserved", "Asx.Itch.Mdp.reserved", ftypes.BYTES)
asx_itch_mdp_2_4_0.fields.second = ProtoField.new("Second", "Asx.Itch.Mdp.second", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.second_leg_contract_number = ProtoField.new("Second Leg Contract Number", "Asx.Itch.Mdp.secondlegcontractnumber", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.secondary_ratio = ProtoField.new("Secondary Ratio", "Asx.Itch.Mdp.secondaryratio", ftypes.UINT8)
asx_itch_mdp_2_4_0.fields.seller_contract_number = ProtoField.new("Seller Contract Number", "Asx.Itch.Mdp.sellercontractnumber", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.seller_quantity_remaining = ProtoField.new("Seller Quantity Remaining", "Asx.Itch.Mdp.sellerquantityremaining", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.selling_order_number = ProtoField.new("Selling Order Number", "Asx.Itch.Mdp.sellingordernumber", ftypes.UINT64)
asx_itch_mdp_2_4_0.fields.sequence = ProtoField.new("Sequence", "Asx.Itch.Mdp.sequence", ftypes.UINT64)
asx_itch_mdp_2_4_0.fields.session = ProtoField.new("Session", "Asx.Itch.Mdp.session", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.session_week = ProtoField.new("Session Week", "Asx.Itch.Mdp.sessionweek", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.session_year = ProtoField.new("Session Year", "Asx.Itch.Mdp.sessionyear", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.settlement_price = ProtoField.new("Settlement Price", "Asx.Itch.Mdp.settlementprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.settlement_type = ProtoField.new("Settlement Type", "Asx.Itch.Mdp.settlementtype", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.side = ProtoField.new("Side", "Asx.Itch.Mdp.side", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.side_leg_1 = ProtoField.new("Side Leg 1", "Asx.Itch.Mdp.sideleg1", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.side_leg_2 = ProtoField.new("Side Leg 2", "Asx.Itch.Mdp.sideleg2", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.side_leg_3 = ProtoField.new("Side Leg 3", "Asx.Itch.Mdp.sideleg3", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.side_leg_4 = ProtoField.new("Side Leg 4", "Asx.Itch.Mdp.sideleg4", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.side_leg_5 = ProtoField.new("Side Leg 5", "Asx.Itch.Mdp.sideleg5", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.side_leg_6 = ProtoField.new("Side Leg 6", "Asx.Itch.Mdp.sideleg6", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.side_of_buyer = ProtoField.new("Side of Buyer", "Asx.Itch.Mdp.sideofbuyer", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.side_of_seller = ProtoField.new("Side of Seller", "Asx.Itch.Mdp.sideofseller", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.source_id = ProtoField.new("Source Id", "Asx.Itch.Mdp.sourceid", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.spread_executed = ProtoField.new("Spread Executed", "Asx.Itch.Mdp.spreadexecuted", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.spread_symbol_directory = ProtoField.new("Spread Symbol Directory", "Asx.Itch.Mdp.spreadsymboldirectory", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.spread_trade_price = ProtoField.new("Spread Trade Price", "Asx.Itch.Mdp.spreadtradeprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.strike = ProtoField.new("Strike", "Asx.Itch.Mdp.strike", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.strike_price_decimal_position = ProtoField.new("Strike Price Decimal Position", "Asx.Itch.Mdp.strikepricedecimalposition", ftypes.UINT8)
asx_itch_mdp_2_4_0.fields.strike_price_fractional_denominator = ProtoField.new("Strike Price Fractional Denominator", "Asx.Itch.Mdp.strikepricefractionaldenominator", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.strike_price_minimum_tick = ProtoField.new("Strike Price Minimum Tick", "Asx.Itch.Mdp.strikepriceminimumtick", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.system_event = ProtoField.new("System Event", "Asx.Itch.Mdp.systemevent", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.text_message = ProtoField.new("Text message", "Asx.Itch.Mdp.textmessage", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.time_message = ProtoField.new("Time Message", "Asx.Itch.Mdp.timemessage", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.timestamp = ProtoField.new("Timestamp", "Asx.Itch.Mdp.timestamp", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.total_traded_volume = ProtoField.new("Total Traded Volume", "Asx.Itch.Mdp.totaltradedvolume", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.total_traded_volume_and_total_trades = ProtoField.new("Total Traded Volume and Total Trades", "Asx.Itch.Mdp.totaltradedvolumeandtotaltrades", ftypes.UINT16, nil, base.DEC, "0x000020")
asx_itch_mdp_2_4_0.fields.total_trades = ProtoField.new("Total Trades", "Asx.Itch.Mdp.totaltrades", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.trade_cancellation = ProtoField.new("Trade Cancellation", "Asx.Itch.Mdp.tradecancellation", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.trade_date = ProtoField.new("Trade Date", "Asx.Itch.Mdp.tradedate", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.trade_price = ProtoField.new("Trade Price", "Asx.Itch.Mdp.tradeprice", ftypes.INT32)
asx_itch_mdp_2_4_0.fields.trade_side_of_leg = ProtoField.new("Trade Side of Leg", "Asx.Itch.Mdp.tradesideofleg", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.trade_side_of_noncustom_order = ProtoField.new("Trade Side of NonCustom Order", "Asx.Itch.Mdp.tradesideofnoncustomorder", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.trade_spread_execution_chain = ProtoField.new("Trade Spread Execution Chain", "Asx.Itch.Mdp.tradespreadexecutionchain", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.trade_type = ProtoField.new("Trade Type", "Asx.Itch.Mdp.tradetype", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.traded_contract_number = ProtoField.new("Traded Contract Number", "Asx.Itch.Mdp.tradedcontractnumber", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.trading_service = ProtoField.new("Trading Service", "Asx.Itch.Mdp.tradingservice", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.trading_status = ProtoField.new("Trading Status", "Asx.Itch.Mdp.tradingstatus", ftypes.STRING)
asx_itch_mdp_2_4_0.fields.underlying_contract_number = ProtoField.new("Underlying Contract Number", "Asx.Itch.Mdp.underlyingcontractnumber", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.voi_trade_date = ProtoField.new("VOI Trade Date", "Asx.Itch.Mdp.voitradedate", ftypes.UINT16)
asx_itch_mdp_2_4_0.fields.volatility = ProtoField.new("Volatility", "Asx.Itch.Mdp.volatility", ftypes.UINT32)
asx_itch_mdp_2_4_0.fields.volume_and_open_interest = ProtoField.new("Volume and Open Interest", "Asx.Itch.Mdp.volumeandopeninterest", ftypes.STRING)

-----------------------------------------------------------------------
-- Dissect Asx Itch Mdp 2.4.0
-----------------------------------------------------------------------

-- Display VOI Trade Date
display.voi_trade_date = function(value)
  return "VOI Trade Date: "..value
end

-- Dissect VOI Trade Date Field
dissect.voi_trade_date = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.voi_trade_date(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.voi_trade_date, range, value, display)

  return offset + size
end

-- Display Open Interest
display.open_interest = function(value)
  return "Open Interest: "..value
end

-- Dissect Open Interest Field
dissect.open_interest = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.open_interest(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.open_interest, range, value, display)

  return offset + size
end

-- Display Cumulative Volume
display.cumulative_volume = function(value)
  return "Cumulative Volume: "..value
end

-- Dissect Cumulative Volume Field
dissect.cumulative_volume = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.cumulative_volume(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.cumulative_volume, range, value, display)

  return offset + size
end

-- Display Contract Number
display.contract_number = function(value)
  return "Contract Number: "..value
end

-- Dissect Contract Number Field
dissect.contract_number = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.contract_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.contract_number, range, value, display)

  return offset + size
end

-- Display Trade Date
display.trade_date = function(value)
  return "Trade Date: "..value
end

-- Dissect Trade Date Field
dissect.trade_date = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.trade_date(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.trade_date, range, value, display)

  return offset + size
end

-- Display Timestamp
display.timestamp = function(value)
  return "Timestamp: "..value
end

-- Dissect Timestamp Field
dissect.timestamp = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.timestamp(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.timestamp, range, value, display)

  return offset + size
end

-- Display function for: Volume and Open Interest
display.volume_and_open_interest = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Volume and Open Interest Fields
dissect.volume_and_open_interest_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Cumulative Volume: 4 Byte Unsigned Fixed Width Integer
  index = dissect.cumulative_volume(buffer, index, packet, parent)

  -- Open Interest: 4 Byte Unsigned Fixed Width Integer
  index = dissect.open_interest(buffer, index, packet, parent)

  -- VOI Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.voi_trade_date(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Volume and Open Interest
dissect.volume_and_open_interest = function(buffer, offset, packet, parent)
  if not show.volume_and_open_interest then
    return dissect.volume_and_open_interest_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 20)
  local display = display.volume_and_open_interest(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.volume_and_open_interest, range, display)

  return dissect.volume_and_open_interest_fields(buffer, offset, packet, element)
end

-- Display ETR Lower Price
display.etr_lower_price = function(value)
  return "ETR Lower Price: "..value
end

-- Dissect ETR Lower Price Field
dissect.etr_lower_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.etr_lower_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.etr_lower_price, range, value, display)

  return offset + size
end

-- Display ETR Upper Price
display.etr_upper_price = function(value)
  return "ETR Upper Price: "..value
end

-- Dissect ETR Upper Price Field
dissect.etr_upper_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.etr_upper_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.etr_upper_price, range, value, display)

  return offset + size
end

-- Display ETR Price
display.etr_price = function(value)
  return "ETR Price: "..value
end

-- Dissect ETR Price Field
dissect.etr_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.etr_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.etr_price, range, value, display)

  return offset + size
end

-- Display AOT Lower Price
display.aot_lower_price = function(value)
  return "AOT Lower Price: "..value
end

-- Dissect AOT Lower Price Field
dissect.aot_lower_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.aot_lower_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.aot_lower_price, range, value, display)

  return offset + size
end

-- Display AOT Upper Price
display.aot_upper_price = function(value)
  return "AOT Upper Price: "..value
end

-- Dissect AOT Upper Price Field
dissect.aot_upper_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.aot_upper_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.aot_upper_price, range, value, display)

  return offset + size
end

-- Display AOT Price
display.aot_price = function(value)
  return "AOT Price: "..value
end

-- Dissect AOT Price Field
dissect.aot_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.aot_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.aot_price, range, value, display)

  return offset + size
end

-- Display function for: Anomalous Order Threshold Publish
display.anomalous_order_threshold_publish = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Anomalous Order Threshold Publish Fields
dissect.anomalous_order_threshold_publish_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- AOT Price: 4 Byte Signed Fixed Width Integer
  index = dissect.aot_price(buffer, index, packet, parent)

  -- AOT Upper Price: 4 Byte Signed Fixed Width Integer
  index = dissect.aot_upper_price(buffer, index, packet, parent)

  -- AOT Lower Price: 4 Byte Signed Fixed Width Integer
  index = dissect.aot_lower_price(buffer, index, packet, parent)

  -- ETR Price: 4 Byte Signed Fixed Width Integer
  index = dissect.etr_price(buffer, index, packet, parent)

  -- ETR Upper Price: 4 Byte Signed Fixed Width Integer
  index = dissect.etr_upper_price(buffer, index, packet, parent)

  -- ETR Lower Price: 4 Byte Signed Fixed Width Integer
  index = dissect.etr_lower_price(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Anomalous Order Threshold Publish
dissect.anomalous_order_threshold_publish = function(buffer, offset, packet, parent)
  if not show.anomalous_order_threshold_publish then
    return dissect.anomalous_order_threshold_publish_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 34)
  local display = display.anomalous_order_threshold_publish(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.anomalous_order_threshold_publish, range, display)

  return dissect.anomalous_order_threshold_publish_fields(buffer, offset, packet, element)
end

-- Display Quantity
display.quantity = function(value)
  return "Quantity: "..value
end

-- Dissect Quantity Field
dissect.quantity = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.quantity(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.quantity, range, value, display)

  return offset + size
end

-- Display Price
display.price = function(value)
  return "Price: "..value
end

-- Dissect Price Field
dissect.price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.price, range, value, display)

  return offset + size
end

-- Display function for: Request for Quote
display.request_for_quote = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Request for Quote Fields
dissect.request_for_quote_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Price: 4 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Request for Quote
dissect.request_for_quote = function(buffer, offset, packet, parent)
  if not show.request_for_quote then
    return dissect.request_for_quote_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 18)
  local display = display.request_for_quote(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.request_for_quote, range, display)

  return dissect.request_for_quote_fields(buffer, offset, packet, element)
end

-- Display Text message
display.text_message = function(value)
  return "Text message: "..value
end

-- Dissect Text message Field
dissect.text_message = function(buffer, offset, packet, parent)
  local size = 100
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.text_message(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.text_message, range, value, display)

  return offset + size
end

-- Display Source Id
display.source_id = function(value)
  return "Source Id: "..value
end

-- Dissect Source Id Field
dissect.source_id = function(buffer, offset, packet, parent)
  local size = 6
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.source_id(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.source_id, range, value, display)

  return offset + size
end

-- Display function for: Ad Hoc Text Message
display.ad_hoc_text_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Ad Hoc Text Message Fields
dissect.ad_hoc_text_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Source Id: 6 Byte Ascii String
  index = dissect.source_id(buffer, index, packet, parent)

  -- Text message: 100 Byte Ascii String
  index = dissect.text_message(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Ad Hoc Text Message
dissect.ad_hoc_text_message = function(buffer, offset, packet, parent)
  if not show.ad_hoc_text_message then
    return dissect.ad_hoc_text_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 112)
  local display = display.ad_hoc_text_message(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.ad_hoc_text_message, range, display)

  return dissect.ad_hoc_text_message_fields(buffer, offset, packet, element)
end

-- Display Settlement Type
display.settlement_type = function(value)
  return "Settlement Type: "..value
end

-- Dissect Settlement Type Field
dissect.settlement_type = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.settlement_type(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.settlement_type, range, value, display)

  return offset + size
end

-- Display Volatility
display.volatility = function(value)
  return "Volatility: "..value
end

-- Dissect Volatility Field
dissect.volatility = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.volatility(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.volatility, range, value, display)

  return offset + size
end

-- Display Settlement Price
display.settlement_price = function(value)
  return "Settlement Price: "..value
end

-- Dissect Settlement Price Field
dissect.settlement_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.settlement_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.settlement_price, range, value, display)

  return offset + size
end

-- Display function for: Market Settlement
display.market_settlement = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Market Settlement Fields
dissect.market_settlement_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Settlement Price: 4 Byte Signed Fixed Width Integer
  index = dissect.settlement_price(buffer, index, packet, parent)

  -- Volatility: 4 Byte Unsigned Fixed Width Integer
  index = dissect.volatility(buffer, index, packet, parent)

  -- Settlement Type: 1 Byte Ascii String
  index = dissect.settlement_type(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Market Settlement
dissect.market_settlement = function(buffer, offset, packet, parent)
  if not show.market_settlement then
    return dissect.market_settlement_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 19)
  local display = display.market_settlement(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.market_settlement, range, display)

  return dissect.market_settlement_fields(buffer, offset, packet, element)
end

-- Display Opening Trade Price
display.opening_trade_price = function(buffer, packet, parent)
  local display = ""


  return display:sub(1, -2)
end

-- Dissect Bit Fields:
dissect.opening_trade_price_bits = function(buffer, offset, packet, parent)
end

-- Dissect Bit Field
dissect.opening_trade_price = function(buffer, offset, packet, parent)
  local size = 0
  local range = buffer(offset, size)
  local display = display.opening_trade_price(range, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.opening_trade_price, range, display)

  if show.opening_trade_price then
    dissect.opening_trade_price_bits(buffer, offset, packet, element)
  end

  return offset + 0
end

-- Display Highest Traded Price
display.highest_traded_price = function(buffer, packet, parent)
  local display = ""


  return display:sub(1, -2)
end

-- Dissect Bit Fields:
dissect.highest_traded_price_bits = function(buffer, offset, packet, parent)
end

-- Dissect Bit Field
dissect.highest_traded_price = function(buffer, offset, packet, parent)
  local size = 0
  local range = buffer(offset, size)
  local display = display.highest_traded_price(range, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.highest_traded_price, range, display)

  if show.highest_traded_price then
    dissect.highest_traded_price_bits(buffer, offset, packet, element)
  end

  return offset + 0
end

-- Display Lowest Traded Price
display.lowest_traded_price = function(buffer, packet, parent)
  local display = ""


  return display:sub(1, -2)
end

-- Dissect Bit Fields:
dissect.lowest_traded_price_bits = function(buffer, offset, packet, parent)
end

-- Dissect Bit Field
dissect.lowest_traded_price = function(buffer, offset, packet, parent)
  local size = 0
  local range = buffer(offset, size)
  local display = display.lowest_traded_price(range, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.lowest_traded_price, range, display)

  if show.lowest_traded_price then
    dissect.lowest_traded_price_bits(buffer, offset, packet, element)
  end

  return offset + 0
end

-- Display Total Traded Volume and Total Trades
display.total_traded_volume_and_total_trades = function(buffer, packet, parent)
  local display = ""


  return display:sub(1, -2)
end

-- Dissect Bit Fields:
dissect.total_traded_volume_and_total_trades_bits = function(buffer, offset, packet, parent)
end

-- Dissect Bit Field
dissect.total_traded_volume_and_total_trades = function(buffer, offset, packet, parent)
  local size = 0
  local range = buffer(offset, size)
  local display = display.total_traded_volume_and_total_trades(range, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.total_traded_volume_and_total_trades, range, display)

  if show.total_traded_volume_and_total_trades then
    dissect.total_traded_volume_and_total_trades_bits(buffer, offset, packet, element)
  end

  return offset + 0
end

-- Display Last Traded Price
display.last_traded_price = function(buffer, packet, parent)
  local display = ""


  return display:sub(1, -2)
end

-- Dissect Bit Fields:
dissect.last_traded_price_bits = function(buffer, offset, packet, parent)
end

-- Dissect Bit Field
dissect.last_traded_price = function(buffer, offset, packet, parent)
  local size = 0
  local range = buffer(offset, size)
  local display = display.last_traded_price(range, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.last_traded_price, range, display)

  if show.last_traded_price then
    dissect.last_traded_price_bits(buffer, offset, packet, element)
  end

  return offset + 0
end

-- Display Last Traded Volume
display.last_traded_volume = function(buffer, packet, parent)
  local display = ""


  return display:sub(1, -2)
end

-- Dissect Bit Fields:
dissect.last_traded_volume_bits = function(buffer, offset, packet, parent)
end

-- Dissect Bit Field
dissect.last_traded_volume = function(buffer, offset, packet, parent)
  local size = 0
  local range = buffer(offset, size)
  local display = display.last_traded_volume(range, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.last_traded_volume, range, display)

  if show.last_traded_volume then
    dissect.last_traded_volume_bits(buffer, offset, packet, element)
  end

  return offset + 0
end

-- Display Reserved
display.reserved = function(value)
  return "Reserved: "..value
end

-- Dissect Reserved Field
dissect.reserved = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:bytes():tohex(false, " ")
  local display = display.reserved(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.reserved, range, value, display)

  return offset + size
end

-- Display Market Updates
display.market_updates = function(buffer, packet, parent)
  local display = ""

  -- Is Last Traded Volume flag set?
  if buffer:bitfield(16) > 0 then
    display = display.."Last Traded Volume|"
  end
  -- Is Last Traded Price flag set?
  if buffer:bitfield(17) > 0 then
    display = display.."Last Traded Price|"
  end
  -- Is Total Traded Volume and Total Trades flag set?
  if buffer:bitfield(18) > 0 then
    display = display.."Total Traded Volume and Total Trades|"
  end
  -- Is Lowest Traded Price flag set?
  if buffer:bitfield(19) > 0 then
    display = display.."Lowest Traded Price|"
  end
  -- Is Highest Traded Price flag set?
  if buffer:bitfield(20) > 0 then
    display = display.."Highest Traded Price|"
  end
  -- Is Opening Trade Price flag set?
  if buffer:bitfield(21) > 0 then
    display = display.."Opening Trade Price|"
  end

  return display:sub(1, -2)
end

-- Dissect Bit Fields:
dissect.market_updates_bits = function(buffer, offset, packet, parent)

  -- Reserved: 2 Byte
  parent:add(asx_itch_mdp_2_4_0.fields.reserved, buffer(offset + 0, 2))

  -- Last Traded Volume: 1 Bit
  parent:add(asx_itch_mdp_2_4_0.fields.last_traded_volume, buffer(offset + 0, 2))

  -- Last Traded Price: 1 Bit
  parent:add(asx_itch_mdp_2_4_0.fields.last_traded_price, buffer(offset + 0, 2))

  -- Total Traded Volume and Total Trades: 1 Bit
  parent:add(asx_itch_mdp_2_4_0.fields.total_traded_volume_and_total_trades, buffer(offset + 0, 2))

  -- Lowest Traded Price: 1 Bit
  parent:add(asx_itch_mdp_2_4_0.fields.lowest_traded_price, buffer(offset + 0, 2))

  -- Highest Traded Price: 1 Bit
  parent:add(asx_itch_mdp_2_4_0.fields.highest_traded_price, buffer(offset + 0, 2))

  -- Opening Trade Price: 1 Bit
  parent:add(asx_itch_mdp_2_4_0.fields.opening_trade_price, buffer(offset + 0, 2))
end

-- Dissect Bit Field
dissect.market_updates = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local display = display.market_updates(range, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.market_updates, range, display)

  if show.market_updates then
    dissect.market_updates_bits(buffer, offset, packet, element)
  end

  return offset + 2
end

-- Display Total Trades
display.total_trades = function(value)
  return "Total Trades: "..value
end

-- Dissect Total Trades Field
dissect.total_trades = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.total_trades(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.total_trades, range, value, display)

  return offset + size
end

-- Display Total Traded Volume
display.total_traded_volume = function(value)
  return "Total Traded Volume: "..value
end

-- Dissect Total Traded Volume Field
dissect.total_traded_volume = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.total_traded_volume(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.total_traded_volume, range, value, display)

  return offset + size
end

-- Display Last Volume
display.last_volume = function(value)
  return "Last Volume: "..value
end

-- Dissect Last Volume Field
dissect.last_volume = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.last_volume(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.last_volume, range, value, display)

  return offset + size
end

-- Display Last Trade
display.last_trade = function(value)
  return "Last Trade: "..value
end

-- Dissect Last Trade Field
dissect.last_trade = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.last_trade(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.last_trade, range, value, display)

  return offset + size
end

-- Display Lowest Trade
display.lowest_trade = function(value)
  return "Lowest Trade: "..value
end

-- Dissect Lowest Trade Field
dissect.lowest_trade = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.lowest_trade(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.lowest_trade, range, value, display)

  return offset + size
end

-- Display Highest Trade
display.highest_trade = function(value)
  return "Highest Trade: "..value
end

-- Dissect Highest Trade Field
dissect.highest_trade = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.highest_trade(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.highest_trade, range, value, display)

  return offset + size
end

-- Display Opening Trade
display.opening_trade = function(value)
  return "Opening Trade: "..value
end

-- Dissect Opening Trade Field
dissect.opening_trade = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.opening_trade(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.opening_trade, range, value, display)

  return offset + size
end

-- Display function for: Open, High, Low, Last Trade Adjustment
display.open__high__low__last_trade_adjustment = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Open, High, Low, Last Trade Adjustment Fields
dissect.open__high__low__last_trade_adjustment_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Opening Trade: 4 Byte Signed Fixed Width Integer
  index = dissect.opening_trade(buffer, index, packet, parent)

  -- Highest Trade: 4 Byte Signed Fixed Width Integer
  index = dissect.highest_trade(buffer, index, packet, parent)

  -- Lowest Trade: 4 Byte Signed Fixed Width Integer
  index = dissect.lowest_trade(buffer, index, packet, parent)

  -- Last Trade: 4 Byte Signed Fixed Width Integer
  index = dissect.last_trade(buffer, index, packet, parent)

  -- Last Volume: 4 Byte Unsigned Fixed Width Integer
  index = dissect.last_volume(buffer, index, packet, parent)

  -- Total Traded Volume: 4 Byte Unsigned Fixed Width Integer
  index = dissect.total_traded_volume(buffer, index, packet, parent)

  -- Total Trades: 4 Byte Unsigned Fixed Width Integer
  index = dissect.total_trades(buffer, index, packet, parent)

  -- Market Updates: 1 Byte Unsigned Fixed Width Integer: Struct of 7 fields
  index = dissect.market_updates(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Open, High, Low, Last Trade Adjustment
dissect.open__high__low__last_trade_adjustment = function(buffer, offset, packet, parent)
  if not show.open__high__low__last_trade_adjustment then
    return dissect.open__high__low__last_trade_adjustment_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 40)
  local display = display.open__high__low__last_trade_adjustment(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.open__high__low__last_trade_adjustment, range, display)

  return dissect.open__high__low__last_trade_adjustment_fields(buffer, offset, packet, element)
end

-- Display Best Ask Quantity
display.best_ask_quantity = function(value)
  return "Best Ask Quantity: "..value
end

-- Dissect Best Ask Quantity Field
dissect.best_ask_quantity = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.best_ask_quantity(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.best_ask_quantity, range, value, display)

  return offset + size
end

-- Display Best Bid Quantity
display.best_bid_quantity = function(value)
  return "Best Bid Quantity: "..value
end

-- Dissect Best Bid Quantity Field
dissect.best_bid_quantity = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.best_bid_quantity(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.best_bid_quantity, range, value, display)

  return offset + size
end

-- Display Best Ask Price
display.best_ask_price = function(value)
  return "Best Ask Price: "..value
end

-- Dissect Best Ask Price Field
dissect.best_ask_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.best_ask_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.best_ask_price, range, value, display)

  return offset + size
end

-- Display Best Bid Price
display.best_bid_price = function(value)
  return "Best Bid Price: "..value
end

-- Dissect Best Bid Price Field
dissect.best_bid_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.best_bid_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.best_bid_price, range, value, display)

  return offset + size
end

-- Display Equilibrium Price
display.equilibrium_price = function(value)
  return "Equilibrium Price: "..value
end

-- Dissect Equilibrium Price Field
dissect.equilibrium_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.equilibrium_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.equilibrium_price, range, value, display)

  return offset + size
end

-- Display function for: Equilibrium Price Auction Info
display.equilibrium_price_auction_info = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Equilibrium Price Auction Info Fields
dissect.equilibrium_price_auction_info_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Equilibrium Price: 4 Byte Signed Fixed Width Integer
  index = dissect.equilibrium_price(buffer, index, packet, parent)

  -- Best Bid Price: 4 Byte Signed Fixed Width Integer
  index = dissect.best_bid_price(buffer, index, packet, parent)

  -- Best Ask Price: 4 Byte Signed Fixed Width Integer
  index = dissect.best_ask_price(buffer, index, packet, parent)

  -- Best Bid Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.best_bid_quantity(buffer, index, packet, parent)

  -- Best Ask Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.best_ask_quantity(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Equilibrium Price Auction Info
dissect.equilibrium_price_auction_info = function(buffer, offset, packet, parent)
  if not show.equilibrium_price_auction_info then
    return dissect.equilibrium_price_auction_info_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 30)
  local display = display.equilibrium_price_auction_info(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.equilibrium_price_auction_info, range, display)

  return dissect.equilibrium_price_auction_info_fields(buffer, offset, packet, element)
end

-- Display Match Number
display.match_number = function(value)
  return "Match Number: "..value
end

-- Dissect Match Number Field
dissect.match_number = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.match_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.match_number, range, value, display)

  return offset + size
end

-- Display function for: Trade Cancellation
display.trade_cancellation = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Trade Cancellation Fields
dissect.trade_cancellation_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Match Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Trade Cancellation
dissect.trade_cancellation = function(buffer, offset, packet, parent)
  if not show.trade_cancellation then
    return dissect.trade_cancellation_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 10)
  local display = display.trade_cancellation(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.trade_cancellation, range, display)

  return dissect.trade_cancellation_fields(buffer, offset, packet, element)
end

-- Display Field: Printable
display.printable = function(value)
  if value == "N" then
    return "Printable: Non printable (N)"
  end
  if value == "Y" then
    return "Printable: printable (Y)"
  end

  return "Printable: Unknown("..value..")"
end

-- Dissect Printable Field
dissect.printable = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.printable(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.printable, range, value, display)

  return offset + size
end

-- Display Trade Side of NonCustom Order
display.trade_side_of_noncustom_order = function(value)
  return "Trade Side of NonCustom Order: "..value
end

-- Dissect Trade Side of NonCustom Order Field
dissect.trade_side_of_noncustom_order = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.trade_side_of_noncustom_order(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.trade_side_of_noncustom_order, range, value, display)

  return offset + size
end

-- Display Traded Contract Number
display.traded_contract_number = function(value)
  return "Traded Contract Number: "..value
end

-- Dissect Traded Contract Number Field
dissect.traded_contract_number = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.traded_contract_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.traded_contract_number, range, value, display)

  return offset + size
end

-- Display Trade Price
display.trade_price = function(value)
  return "Trade Price: "..value
end

-- Dissect Trade Price Field
dissect.trade_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.trade_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.trade_price, range, value, display)

  return offset + size
end

-- Display Executed Quantity
display.executed_quantity = function(value)
  return "Executed Quantity: "..value
end

-- Dissect Executed Quantity Field
dissect.executed_quantity = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.executed_quantity(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.executed_quantity, range, value, display)

  return offset + size
end

-- Display Field: Trade Type
display.trade_type = function(value)
  if value == "T" then
    return "Trade Type: Normal (T)"
  end
  if value == "t" then
    return "Trade Type: Crossing Normal (t)"
  end
  if value == "W" then
    return "Trade Type: Sweeping (W)"
  end
  if value == "w" then
    return "Trade Type: Crossing Sweeping (w)"
  end
  if value == "L" then
    return "Trade Type: Levelling (L)"
  end
  if value == "l" then
    return "Trade Type: Crossing Levelling (l)"
  end
  if value == "S" then
    return "Trade Type: Spread to Underlying (S)"
  end
  if value == "s" then
    return "Trade Type: Crossing Spread to Underlying (s)"
  end
  if value == "R" then
    return "Trade Type: IntraSpread (R)"
  end
  if value == "r" then
    return "Trade Type: Crossing Intra Spread (r)"
  end
  if value == "Q" then
    return "Trade Type: Inter Spread (Q)"
  end
  if value == "q" then
    return "Trade Type: Crossing Inter Spread (q)"
  end
  if value == "U" then
    return "Trade Type: Custom (U)"
  end
  if value == "u" then
    return "Trade Type: Crossing Custom (u)"
  end

  return "Trade Type: Unknown("..value..")"
end

-- Dissect Trade Type Field
dissect.trade_type = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.trade_type(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.trade_type, range, value, display)

  return offset + size
end

-- Display Custom Market Quantity Remaining
display.custom_market_quantity_remaining = function(value)
  return "Custom Market Quantity Remaining: "..value
end

-- Dissect Custom Market Quantity Remaining Field
dissect.custom_market_quantity_remaining = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.custom_market_quantity_remaining(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.custom_market_quantity_remaining, range, value, display)

  return offset + size
end

-- Display Custom Market Order Number
display.custom_market_order_number = function(value)
  return "Custom Market Order Number: "..value
end

-- Dissect Custom Market Order Number Field
dissect.custom_market_order_number = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:uint64()
  local display = display.custom_market_order_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.custom_market_order_number, range, value, display)

  return offset + size
end

-- Display Quantity Remaining
display.quantity_remaining = function(value)
  return "Quantity Remaining: "..value
end

-- Dissect Quantity Remaining Field
dissect.quantity_remaining = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.quantity_remaining(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.quantity_remaining, range, value, display)

  return offset + size
end

-- Display Order Number
display.order_number = function(value)
  return "Order Number: "..value
end

-- Dissect Order Number Field
dissect.order_number = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:uint64()
  local display = display.order_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.order_number, range, value, display)

  return offset + size
end

-- Display Field: Side
display.side = function(value)
  if value == "B" then
    return "Side: Buy (B)"
  end
  if value == "S" then
    return "Side: Sell (S)"
  end

  return "Side: Unknown("..value..")"
end

-- Dissect Side Field
dissect.side = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.side(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.side, range, value, display)

  return offset + size
end

-- Display function for: Custom Market Trade
display.custom_market_trade = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Custom Market Trade Fields
dissect.custom_market_trade_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  -- Quantity Remaining: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity_remaining(buffer, index, packet, parent)

  -- Custom Market Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.custom_market_order_number(buffer, index, packet, parent)

  -- Custom Market Quantity Remaining: 4 Byte Unsigned Fixed Width Integer
  index = dissect.custom_market_quantity_remaining(buffer, index, packet, parent)

  -- Trade Type: 1 Byte Ascii String Enum with 14 values
  index = dissect.trade_type(buffer, index, packet, parent)

  -- Match Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  -- Executed Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.executed_quantity(buffer, index, packet, parent)

  -- Trade Price: 4 Byte Signed Fixed Width Integer
  index = dissect.trade_price(buffer, index, packet, parent)

  -- Traded Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.traded_contract_number(buffer, index, packet, parent)

  -- Trade Side of NonCustom Order: 1 Byte Ascii String
  index = dissect.trade_side_of_noncustom_order(buffer, index, packet, parent)

  -- Printable: 1 Byte Ascii String Enum with 2 values
  index = dissect.printable(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Custom Market Trade
dissect.custom_market_trade = function(buffer, offset, packet, parent)
  if not show.custom_market_trade then
    return dissect.custom_market_trade_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 54)
  local display = display.custom_market_trade(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.custom_market_trade, range, display)

  return dissect.custom_market_trade_fields(buffer, offset, packet, element)
end

-- Display Trade Side of Leg
display.trade_side_of_leg = function(value)
  return "Trade Side of Leg: "..value
end

-- Dissect Trade Side of Leg Field
dissect.trade_side_of_leg = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.trade_side_of_leg(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.trade_side_of_leg, range, value, display)

  return offset + size
end

-- Display function for: Custom Market Executed
display.custom_market_executed = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Custom Market Executed Fields
dissect.custom_market_executed_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  -- Quantity Remaining: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity_remaining(buffer, index, packet, parent)

  -- Trade Type: 1 Byte Ascii String Enum with 14 values
  index = dissect.trade_type(buffer, index, packet, parent)

  -- Match Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  -- Executed Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.executed_quantity(buffer, index, packet, parent)

  -- Trade Price: 4 Byte Signed Fixed Width Integer
  index = dissect.trade_price(buffer, index, packet, parent)

  -- Traded Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.traded_contract_number(buffer, index, packet, parent)

  -- Trade Side of Leg: 1 Byte Ascii String
  index = dissect.trade_side_of_leg(buffer, index, packet, parent)

  -- Printable: 1 Byte Ascii String Enum with 2 values
  index = dissect.printable(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Custom Market Executed
dissect.custom_market_executed = function(buffer, offset, packet, parent)
  if not show.custom_market_executed then
    return dissect.custom_market_executed_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 37)
  local display = display.custom_market_executed(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.custom_market_executed, range, display)

  return dissect.custom_market_executed_fields(buffer, offset, packet, element)
end

-- Display Spread Trade Price
display.spread_trade_price = function(value)
  return "Spread Trade Price: "..value
end

-- Dissect Spread Trade Price Field
dissect.spread_trade_price = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.spread_trade_price(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.spread_trade_price, range, value, display)

  return offset + size
end

-- Display Seller Quantity Remaining
display.seller_quantity_remaining = function(value)
  return "Seller Quantity Remaining: "..value
end

-- Dissect Seller Quantity Remaining Field
dissect.seller_quantity_remaining = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.seller_quantity_remaining(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.seller_quantity_remaining, range, value, display)

  return offset + size
end

-- Display Selling Order Number
display.selling_order_number = function(value)
  return "Selling Order Number: "..value
end

-- Dissect Selling Order Number Field
dissect.selling_order_number = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:uint64()
  local display = display.selling_order_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.selling_order_number, range, value, display)

  return offset + size
end

-- Display Side of Seller
display.side_of_seller = function(value)
  return "Side of Seller: "..value
end

-- Dissect Side of Seller Field
dissect.side_of_seller = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.side_of_seller(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.side_of_seller, range, value, display)

  return offset + size
end

-- Display Seller Contract Number
display.seller_contract_number = function(value)
  return "Seller Contract Number: "..value
end

-- Dissect Seller Contract Number Field
dissect.seller_contract_number = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.seller_contract_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.seller_contract_number, range, value, display)

  return offset + size
end

-- Display Buyer Quantity Remaining
display.buyer_quantity_remaining = function(value)
  return "Buyer Quantity Remaining: "..value
end

-- Dissect Buyer Quantity Remaining Field
dissect.buyer_quantity_remaining = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.buyer_quantity_remaining(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.buyer_quantity_remaining, range, value, display)

  return offset + size
end

-- Display Buyer Order Number
display.buyer_order_number = function(value)
  return "Buyer Order Number: "..value
end

-- Dissect Buyer Order Number Field
dissect.buyer_order_number = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:uint64()
  local display = display.buyer_order_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.buyer_order_number, range, value, display)

  return offset + size
end

-- Display Side of Buyer
display.side_of_buyer = function(value)
  return "Side of Buyer: "..value
end

-- Dissect Side of Buyer Field
dissect.side_of_buyer = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.side_of_buyer(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.side_of_buyer, range, value, display)

  return offset + size
end

-- Display Buyer
display.buyer = function(value)
  return "Buyer: "..value
end

-- Dissect Buyer Field
dissect.buyer = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.buyer(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.buyer, range, value, display)

  return offset + size
end

-- Display function for: Trade Spread Execution Chain
display.trade_spread_execution_chain = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Trade Spread Execution Chain Fields
dissect.trade_spread_execution_chain_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Buyer: 4 Byte Unsigned Fixed Width Integer
  index = dissect.buyer(buffer, index, packet, parent)

  -- Side of Buyer: 1 Byte Ascii String
  index = dissect.side_of_buyer(buffer, index, packet, parent)

  -- Buyer Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.buyer_order_number(buffer, index, packet, parent)

  -- Buyer Quantity Remaining: 4 Byte Unsigned Fixed Width Integer
  index = dissect.buyer_quantity_remaining(buffer, index, packet, parent)

  -- Seller Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seller_contract_number(buffer, index, packet, parent)

  -- Side of Seller: 1 Byte Ascii String
  index = dissect.side_of_seller(buffer, index, packet, parent)

  -- Selling Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.selling_order_number(buffer, index, packet, parent)

  -- Seller Quantity Remaining: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seller_quantity_remaining(buffer, index, packet, parent)

  -- Trade Type: 1 Byte Ascii String Enum with 14 values
  index = dissect.trade_type(buffer, index, packet, parent)

  -- Match Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  -- Executed Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.executed_quantity(buffer, index, packet, parent)

  -- Trade Price: 4 Byte Signed Fixed Width Integer
  index = dissect.trade_price(buffer, index, packet, parent)

  -- Traded Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.traded_contract_number(buffer, index, packet, parent)

  -- Spread Trade Price: 4 Byte Signed Fixed Width Integer
  index = dissect.spread_trade_price(buffer, index, packet, parent)

  -- Printable: 1 Byte Ascii String Enum with 2 values
  index = dissect.printable(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Trade Spread Execution Chain
dissect.trade_spread_execution_chain = function(buffer, offset, packet, parent)
  if not show.trade_spread_execution_chain then
    return dissect.trade_spread_execution_chain_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 62)
  local display = display.trade_spread_execution_chain(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.trade_spread_execution_chain, range, display)

  return dissect.trade_spread_execution_chain_fields(buffer, offset, packet, element)
end

-- Display function for: Spread Executed
display.spread_executed = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Spread Executed Fields
dissect.spread_executed_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  -- Quantity Remaining: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity_remaining(buffer, index, packet, parent)

  -- Trade Type: 1 Byte Ascii String Enum with 14 values
  index = dissect.trade_type(buffer, index, packet, parent)

  -- Match Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  -- Executed Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.executed_quantity(buffer, index, packet, parent)

  -- Trade Price: 4 Byte Signed Fixed Width Integer
  index = dissect.trade_price(buffer, index, packet, parent)

  -- Traded Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.traded_contract_number(buffer, index, packet, parent)

  -- Spread Trade Price: 4 Byte Signed Fixed Width Integer
  index = dissect.spread_trade_price(buffer, index, packet, parent)

  -- Trade Side of Leg: 1 Byte Ascii String
  index = dissect.trade_side_of_leg(buffer, index, packet, parent)

  -- Printable: 1 Byte Ascii String Enum with 2 values
  index = dissect.printable(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Spread Executed
dissect.spread_executed = function(buffer, offset, packet, parent)
  if not show.spread_executed then
    return dissect.spread_executed_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 46)
  local display = display.spread_executed(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.spread_executed, range, display)

  return dissect.spread_executed_fields(buffer, offset, packet, element)
end

-- Display Buying Order Number
display.buying_order_number = function(value)
  return "Buying Order Number: "..value
end

-- Dissect Buying Order Number Field
dissect.buying_order_number = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:uint64()
  local display = display.buying_order_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.buying_order_number, range, value, display)

  return offset + size
end

-- Display function for: Order Executed with Price
display.order_executed_with_price = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Order Executed with Price Fields
dissect.order_executed_with_price_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Buying Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.buying_order_number(buffer, index, packet, parent)

  -- Buyer Quantity Remaining: 4 Byte Unsigned Fixed Width Integer
  index = dissect.buyer_quantity_remaining(buffer, index, packet, parent)

  -- Selling Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.selling_order_number(buffer, index, packet, parent)

  -- Seller Quantity Remaining: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seller_quantity_remaining(buffer, index, packet, parent)

  -- Trade Type: 1 Byte Ascii String Enum with 14 values
  index = dissect.trade_type(buffer, index, packet, parent)

  -- Match Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  -- Executed Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.executed_quantity(buffer, index, packet, parent)

  -- Trade Price: 4 Byte Signed Fixed Width Integer
  index = dissect.trade_price(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Order Executed with Price
dissect.order_executed_with_price = function(buffer, offset, packet, parent)
  if not show.order_executed_with_price then
    return dissect.order_executed_with_price_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 47)
  local display = display.order_executed_with_price(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.order_executed_with_price, range, display)

  return dissect.order_executed_with_price_fields(buffer, offset, packet, element)
end

-- Display function for: Order Executed
display.order_executed = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Order Executed Fields
dissect.order_executed_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  -- Quantity Remaining: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity_remaining(buffer, index, packet, parent)

  -- Trade Type: 1 Byte Ascii String Enum with 14 values
  index = dissect.trade_type(buffer, index, packet, parent)

  -- Match Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.match_number(buffer, index, packet, parent)

  -- Executed Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.executed_quantity(buffer, index, packet, parent)

  -- Trade Price: 4 Byte Signed Fixed Width Integer
  index = dissect.trade_price(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Order Executed
dissect.order_executed = function(buffer, offset, packet, parent)
  if not show.order_executed then
    return dissect.order_executed_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 36)
  local display = display.order_executed(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.order_executed, range, display)

  return dissect.order_executed_fields(buffer, offset, packet, element)
end

-- Display function for: Custom Market Order Deleted
display.custom_market_order_deleted = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Custom Market Order Deleted Fields
dissect.custom_market_order_deleted_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Custom Market Order Deleted
dissect.custom_market_order_deleted = function(buffer, offset, packet, parent)
  if not show.custom_market_order_deleted then
    return dissect.custom_market_order_deleted_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 14)
  local display = display.custom_market_order_deleted(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.custom_market_order_deleted, range, display)

  return dissect.custom_market_order_deleted_fields(buffer, offset, packet, element)
end

-- Display Order Book Priority
display.order_book_priority = function(value)
  return "Order Book Priority: "..value
end

-- Dissect Order Book Priority Field
dissect.order_book_priority = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.order_book_priority(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.order_book_priority, range, value, display)

  return offset + size
end

-- Display function for: Custom Market Order Replaced
display.custom_market_order_replaced = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Custom Market Order Replaced Fields
dissect.custom_market_order_replaced_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  -- Order Book Priority: 4 Byte Unsigned Fixed Width Integer
  index = dissect.order_book_priority(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Custom Market Order Replaced
dissect.custom_market_order_replaced = function(buffer, offset, packet, parent)
  if not show.custom_market_order_replaced then
    return dissect.custom_market_order_replaced_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 22)
  local display = display.custom_market_order_replaced(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.custom_market_order_replaced, range, display)

  return dissect.custom_market_order_replaced_fields(buffer, offset, packet, element)
end

-- Display Price Leg 6
display.price_leg_6 = function(value)
  return "Price Leg 6: "..value
end

-- Dissect Price Leg 6 Field
dissect.price_leg_6 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.price_leg_6(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.price_leg_6, range, value, display)

  return offset + size
end

-- Display Ratio Leg 6
display.ratio_leg_6 = function(value)
  return "Ratio Leg 6: "..value
end

-- Dissect Ratio Leg 6 Field
dissect.ratio_leg_6 = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.ratio_leg_6(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.ratio_leg_6, range, value, display)

  return offset + size
end

-- Display Side Leg 6
display.side_leg_6 = function(value)
  return "Side Leg 6: "..value
end

-- Dissect Side Leg 6 Field
dissect.side_leg_6 = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.side_leg_6(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.side_leg_6, range, value, display)

  return offset + size
end

-- Display Contract Number Leg 6
display.contract_number_leg_6 = function(value)
  return "Contract Number Leg 6: "..value
end

-- Dissect Contract Number Leg 6 Field
dissect.contract_number_leg_6 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.contract_number_leg_6(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.contract_number_leg_6, range, value, display)

  return offset + size
end

-- Display Price Leg 5
display.price_leg_5 = function(value)
  return "Price Leg 5: "..value
end

-- Dissect Price Leg 5 Field
dissect.price_leg_5 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.price_leg_5(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.price_leg_5, range, value, display)

  return offset + size
end

-- Display Ratio Leg 5
display.ratio_leg_5 = function(value)
  return "Ratio Leg 5: "..value
end

-- Dissect Ratio Leg 5 Field
dissect.ratio_leg_5 = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.ratio_leg_5(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.ratio_leg_5, range, value, display)

  return offset + size
end

-- Display Side Leg 5
display.side_leg_5 = function(value)
  return "Side Leg 5: "..value
end

-- Dissect Side Leg 5 Field
dissect.side_leg_5 = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.side_leg_5(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.side_leg_5, range, value, display)

  return offset + size
end

-- Display Contract Number Leg 5
display.contract_number_leg_5 = function(value)
  return "Contract Number Leg 5: "..value
end

-- Dissect Contract Number Leg 5 Field
dissect.contract_number_leg_5 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.contract_number_leg_5(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.contract_number_leg_5, range, value, display)

  return offset + size
end

-- Display Price Leg 4
display.price_leg_4 = function(value)
  return "Price Leg 4: "..value
end

-- Dissect Price Leg 4 Field
dissect.price_leg_4 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.price_leg_4(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.price_leg_4, range, value, display)

  return offset + size
end

-- Display Ratio Leg 4
display.ratio_leg_4 = function(value)
  return "Ratio Leg 4: "..value
end

-- Dissect Ratio Leg 4 Field
dissect.ratio_leg_4 = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.ratio_leg_4(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.ratio_leg_4, range, value, display)

  return offset + size
end

-- Display Side Leg 4
display.side_leg_4 = function(value)
  return "Side Leg 4: "..value
end

-- Dissect Side Leg 4 Field
dissect.side_leg_4 = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.side_leg_4(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.side_leg_4, range, value, display)

  return offset + size
end

-- Display Contract Number Leg 4
display.contract_number_leg_4 = function(value)
  return "Contract Number Leg 4: "..value
end

-- Dissect Contract Number Leg 4 Field
dissect.contract_number_leg_4 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.contract_number_leg_4(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.contract_number_leg_4, range, value, display)

  return offset + size
end

-- Display Price Leg 3
display.price_leg_3 = function(value)
  return "Price Leg 3: "..value
end

-- Dissect Price Leg 3 Field
dissect.price_leg_3 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.price_leg_3(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.price_leg_3, range, value, display)

  return offset + size
end

-- Display Ratio Leg 3
display.ratio_leg_3 = function(value)
  return "Ratio Leg 3: "..value
end

-- Dissect Ratio Leg 3 Field
dissect.ratio_leg_3 = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.ratio_leg_3(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.ratio_leg_3, range, value, display)

  return offset + size
end

-- Display Side Leg 3
display.side_leg_3 = function(value)
  return "Side Leg 3: "..value
end

-- Dissect Side Leg 3 Field
dissect.side_leg_3 = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.side_leg_3(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.side_leg_3, range, value, display)

  return offset + size
end

-- Display Contract Number Leg 3
display.contract_number_leg_3 = function(value)
  return "Contract Number Leg 3: "..value
end

-- Dissect Contract Number Leg 3 Field
dissect.contract_number_leg_3 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.contract_number_leg_3(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.contract_number_leg_3, range, value, display)

  return offset + size
end

-- Display Price Leg 2
display.price_leg_2 = function(value)
  return "Price Leg 2: "..value
end

-- Dissect Price Leg 2 Field
dissect.price_leg_2 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.price_leg_2(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.price_leg_2, range, value, display)

  return offset + size
end

-- Display Ratio Leg 2
display.ratio_leg_2 = function(value)
  return "Ratio Leg 2: "..value
end

-- Dissect Ratio Leg 2 Field
dissect.ratio_leg_2 = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.ratio_leg_2(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.ratio_leg_2, range, value, display)

  return offset + size
end

-- Display Side Leg 2
display.side_leg_2 = function(value)
  return "Side Leg 2: "..value
end

-- Dissect Side Leg 2 Field
dissect.side_leg_2 = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.side_leg_2(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.side_leg_2, range, value, display)

  return offset + size
end

-- Display Contract Number Leg 2
display.contract_number_leg_2 = function(value)
  return "Contract Number Leg 2: "..value
end

-- Dissect Contract Number Leg 2 Field
dissect.contract_number_leg_2 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.contract_number_leg_2(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.contract_number_leg_2, range, value, display)

  return offset + size
end

-- Display Price Leg 1
display.price_leg_1 = function(value)
  return "Price Leg 1: "..value
end

-- Dissect Price Leg 1 Field
dissect.price_leg_1 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.price_leg_1(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.price_leg_1, range, value, display)

  return offset + size
end

-- Display Ratio Leg 1
display.ratio_leg_1 = function(value)
  return "Ratio Leg 1: "..value
end

-- Dissect Ratio Leg 1 Field
dissect.ratio_leg_1 = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.ratio_leg_1(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.ratio_leg_1, range, value, display)

  return offset + size
end

-- Display Side Leg 1
display.side_leg_1 = function(value)
  return "Side Leg 1: "..value
end

-- Dissect Side Leg 1 Field
dissect.side_leg_1 = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.side_leg_1(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.side_leg_1, range, value, display)

  return offset + size
end

-- Display Contract Number Leg 1
display.contract_number_leg_1 = function(value)
  return "Contract Number Leg 1: "..value
end

-- Dissect Contract Number Leg 1 Field
dissect.contract_number_leg_1 = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.contract_number_leg_1(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.contract_number_leg_1, range, value, display)

  return offset + size
end

-- Display Legs
display.legs = function(value)
  return "Legs: "..value
end

-- Dissect Legs Field
dissect.legs = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.legs(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.legs, range, value, display)

  return offset + size
end

-- Display function for: Custom Market Order Added
display.custom_market_order_added = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Custom Market Order Added Fields
dissect.custom_market_order_added_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  -- Order Book Priority: 4 Byte Unsigned Fixed Width Integer
  index = dissect.order_book_priority(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Legs: 1 Byte Unsigned Fixed Width Integer
  index = dissect.legs(buffer, index, packet, parent)

  -- Contract Number Leg 1: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number_leg_1(buffer, index, packet, parent)

  -- Side Leg 1: 1 Byte Ascii String
  index = dissect.side_leg_1(buffer, index, packet, parent)

  -- Ratio Leg 1: 2 Byte Unsigned Fixed Width Integer
  index = dissect.ratio_leg_1(buffer, index, packet, parent)

  -- Price Leg 1: 4 Byte Signed Fixed Width Integer
  index = dissect.price_leg_1(buffer, index, packet, parent)

  -- Contract Number Leg 2: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number_leg_2(buffer, index, packet, parent)

  -- Side Leg 2: 1 Byte Ascii String
  index = dissect.side_leg_2(buffer, index, packet, parent)

  -- Ratio Leg 2: 2 Byte Unsigned Fixed Width Integer
  index = dissect.ratio_leg_2(buffer, index, packet, parent)

  -- Price Leg 2: 4 Byte Signed Fixed Width Integer
  index = dissect.price_leg_2(buffer, index, packet, parent)

  -- Contract Number Leg 3: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number_leg_3(buffer, index, packet, parent)

  -- Side Leg 3: 1 Byte Ascii String
  index = dissect.side_leg_3(buffer, index, packet, parent)

  -- Ratio Leg 3: 2 Byte Unsigned Fixed Width Integer
  index = dissect.ratio_leg_3(buffer, index, packet, parent)

  -- Price Leg 3: 4 Byte Signed Fixed Width Integer
  index = dissect.price_leg_3(buffer, index, packet, parent)

  -- Contract Number Leg 4: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number_leg_4(buffer, index, packet, parent)

  -- Side Leg 4: 1 Byte Ascii String
  index = dissect.side_leg_4(buffer, index, packet, parent)

  -- Ratio Leg 4: 2 Byte Unsigned Fixed Width Integer
  index = dissect.ratio_leg_4(buffer, index, packet, parent)

  -- Price Leg 4: 4 Byte Signed Fixed Width Integer
  index = dissect.price_leg_4(buffer, index, packet, parent)

  -- Contract Number Leg 5: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number_leg_5(buffer, index, packet, parent)

  -- Side Leg 5: 1 Byte Ascii String
  index = dissect.side_leg_5(buffer, index, packet, parent)

  -- Ratio Leg 5: 2 Byte Unsigned Fixed Width Integer
  index = dissect.ratio_leg_5(buffer, index, packet, parent)

  -- Price Leg 5: 4 Byte Signed Fixed Width Integer
  index = dissect.price_leg_5(buffer, index, packet, parent)

  -- Contract Number Leg 6: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number_leg_6(buffer, index, packet, parent)

  -- Side Leg 6: 1 Byte Ascii String
  index = dissect.side_leg_6(buffer, index, packet, parent)

  -- Ratio Leg 6: 2 Byte Unsigned Fixed Width Integer
  index = dissect.ratio_leg_6(buffer, index, packet, parent)

  -- Price Leg 6: 4 Byte Signed Fixed Width Integer
  index = dissect.price_leg_6(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Custom Market Order Added
dissect.custom_market_order_added = function(buffer, offset, packet, parent)
  if not show.custom_market_order_added then
    return dissect.custom_market_order_added_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 89)
  local display = display.custom_market_order_added(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.custom_market_order_added, range, display)

  return dissect.custom_market_order_added_fields(buffer, offset, packet, element)
end

-- Display function for: Implied Order Deleted
display.implied_order_deleted = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Implied Order Deleted Fields
dissect.implied_order_deleted_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Implied Order Deleted
dissect.implied_order_deleted = function(buffer, offset, packet, parent)
  if not show.implied_order_deleted then
    return dissect.implied_order_deleted_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 19)
  local display = display.implied_order_deleted(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.implied_order_deleted, range, display)

  return dissect.implied_order_deleted_fields(buffer, offset, packet, element)
end

-- Display function for: Implied Order Replaced
display.implied_order_replaced = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Implied Order Replaced Fields
dissect.implied_order_replaced_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  -- Order Book Priority: 4 Byte Unsigned Fixed Width Integer
  index = dissect.order_book_priority(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Price: 4 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Implied Order Replaced
dissect.implied_order_replaced = function(buffer, offset, packet, parent)
  if not show.implied_order_replaced then
    return dissect.implied_order_replaced_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 31)
  local display = display.implied_order_replaced(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.implied_order_replaced, range, display)

  return dissect.implied_order_replaced_fields(buffer, offset, packet, element)
end

-- Display function for: Implied Order Added
display.implied_order_added = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Implied Order Added Fields
dissect.implied_order_added_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  -- Order Book Priority: 4 Byte Unsigned Fixed Width Integer
  index = dissect.order_book_priority(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Price: 4 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Implied Order Added
dissect.implied_order_added = function(buffer, offset, packet, parent)
  if not show.implied_order_added then
    return dissect.implied_order_added_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 31)
  local display = display.implied_order_added(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.implied_order_added, range, display)

  return dissect.implied_order_added_fields(buffer, offset, packet, element)
end

-- Display function for: Order Deleted
display.order_deleted = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Order Deleted Fields
dissect.order_deleted_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Order Deleted
dissect.order_deleted = function(buffer, offset, packet, parent)
  if not show.order_deleted then
    return dissect.order_deleted_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 19)
  local display = display.order_deleted(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.order_deleted, range, display)

  return dissect.order_deleted_fields(buffer, offset, packet, element)
end

-- Display function for: Order Volume Cancelled
display.order_volume_cancelled = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Order Volume Cancelled Fields
dissect.order_volume_cancelled_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Order Volume Cancelled
dissect.order_volume_cancelled = function(buffer, offset, packet, parent)
  if not show.order_volume_cancelled then
    return dissect.order_volume_cancelled_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 23)
  local display = display.order_volume_cancelled(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.order_volume_cancelled, range, display)

  return dissect.order_volume_cancelled_fields(buffer, offset, packet, element)
end

-- Display function for: Order Replaced
display.order_replaced = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Order Replaced Fields
dissect.order_replaced_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  -- Order Book Priority: 4 Byte Unsigned Fixed Width Integer
  index = dissect.order_book_priority(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Price: 4 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Order Replaced
dissect.order_replaced = function(buffer, offset, packet, parent)
  if not show.order_replaced then
    return dissect.order_replaced_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 31)
  local display = display.order_replaced(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.order_replaced, range, display)

  return dissect.order_replaced_fields(buffer, offset, packet, element)
end

-- Display function for: Order Added
display.order_added = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Order Added Fields
dissect.order_added_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 2 values
  index = dissect.side(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index = dissect.order_number(buffer, index, packet, parent)

  -- Order Book Priority: 4 Byte Unsigned Fixed Width Integer
  index = dissect.order_book_priority(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Price: 4 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Order Added
dissect.order_added = function(buffer, offset, packet, parent)
  if not show.order_added then
    return dissect.order_added_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 31)
  local display = display.order_added(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.order_added, range, display)

  return dissect.order_added_fields(buffer, offset, packet, element)
end

-- Display Field: Trading Status
display.trading_status = function(value)
  if value == "p" then
    return "Trading Status: Pending (p)"
  end
  if value == "H" then
    return "Trading Status: Halted (H)"
  end
  if value == "P" then
    return "Trading Status: PreOpen (P)"
  end
  if value == "C" then
    return "Trading Status: Closed (C)"
  end
  if value == "l" then
    return "Trading Status: Levelling (l)"
  end
  if value == "L" then
    return "Trading Status: Locked (L)"
  end
  if value == "O" then
    return "Trading Status: Opened (O)"
  end
  if value == "U" then
    return "Trading Status: Unavailable (U)"
  end
  if value == "d" then
    return "Trading Status: Pre Price Discovery (d)"
  end
  if value == "I" then
    return "Trading Status: Inactive (I)"
  end
  if value == "D" then
    return "Trading Status: Price Discovery (D)"
  end
  if value == "A" then
    return "Trading Status: Activated (A)"
  end
  if value == "R" then
    return "Trading Status: Regulatory Halt (R)"
  end

  return "Trading Status: Unknown("..value..")"
end

-- Dissect Trading Status Field
dissect.trading_status = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.trading_status(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.trading_status, range, value, display)

  return offset + size
end

-- Display function for: Order Book State
display.order_book_state = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Order Book State Fields
dissect.order_book_state_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Trading Status: 1 Byte Ascii String Enum with 13 values
  index = dissect.trading_status(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Order Book State
dissect.order_book_state = function(buffer, offset, packet, parent)
  if not show.order_book_state then
    return dissect.order_book_state_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 11)
  local display = display.order_book_state(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.order_book_state, range, display)

  return dissect.order_book_state_fields(buffer, offset, packet, element)
end

-- Display Field: Activated
display.activated = function(value)
  if value == "Y" then
    return "Activated: active (Y)"
  end
  if value == "N" then
    return "Activated: inactive (N)"
  end

  return "Activated: Unknown("..value..")"
end

-- Dissect Activated Field
dissect.activated = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.activated(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.activated, range, value, display)

  return offset + size
end

-- Display Payments per Year
display.payments_per_year = function(value)
  return "Payments per Year: "..value
end

-- Dissect Payments per Year Field
dissect.payments_per_year = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.payments_per_year(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.payments_per_year, range, value, display)

  return offset + size
end

-- Display Coupon Rate
display.coupon_rate = function(value)
  return "Coupon Rate: "..value
end

-- Dissect Coupon Rate Field
dissect.coupon_rate = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.coupon_rate(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.coupon_rate, range, value, display)

  return offset + size
end

-- Display Maturity Value
display.maturity_value = function(value)
  return "Maturity Value: "..value
end

-- Dissect Maturity Value Field
dissect.maturity_value = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.maturity_value(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.maturity_value, range, value, display)

  return offset + size
end

-- Display Lot Size or Face Value
display.lot_size_or_face_value = function(value)
  return "Lot Size or Face Value: "..value
end

-- Dissect Lot Size or Face Value Field
dissect.lot_size_or_face_value = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.lot_size_or_face_value(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.lot_size_or_face_value, range, value, display)

  return offset + size
end

-- Display Currency
display.currency = function(value)
  return "Currency: "..value
end

-- Dissect Currency Field
dissect.currency = function(buffer, offset, packet, parent)
  local size = 3
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.currency(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.currency, range, value, display)

  return offset + size
end

-- Display Field: Financial Type
display.financial_type = function(value)
  if value == "C" then
    return "Financial Type: Commodity (C)"
  end
  if value == "D" then
    return "Financial Type: Cfd (D)"
  end
  if value == "E" then
    return "Financial Type: Equity (E)"
  end
  if value == "X" then
    return "Financial Type: Government Bond (X)"
  end
  if value == "B" then
    return "Financial Type: Bank Bill (B)"
  end

  return "Financial Type: Unknown("..value..")"
end

-- Dissect Financial Type Field
dissect.financial_type = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.financial_type(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.financial_type, range, value, display)

  return offset + size
end

-- Display Prior Day Settlement
display.prior_day_settlement = function(value)
  return "Prior Day Settlement: "..value
end

-- Dissect Prior Day Settlement Field
dissect.prior_day_settlement = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:int()
  local display = display.prior_day_settlement(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.prior_day_settlement, range, value, display)

  return offset + size
end

-- Display Last Trading Date
display.last_trading_date = function(value)
  return "Last Trading Date: "..value
end

-- Dissect Last Trading Date Field
dissect.last_trading_date = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.last_trading_date(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.last_trading_date, range, value, display)

  return offset + size
end

-- Display Strike Price Minimum Tick
display.strike_price_minimum_tick = function(value)
  return "Strike Price Minimum Tick: "..value
end

-- Dissect Strike Price Minimum Tick Field
dissect.strike_price_minimum_tick = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.strike_price_minimum_tick(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.strike_price_minimum_tick, range, value, display)

  return offset + size
end

-- Display Strike Price Fractional Denominator
display.strike_price_fractional_denominator = function(value)
  return "Strike Price Fractional Denominator: "..value
end

-- Dissect Strike Price Fractional Denominator Field
dissect.strike_price_fractional_denominator = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.strike_price_fractional_denominator(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.strike_price_fractional_denominator, range, value, display)

  return offset + size
end

-- Display Strike Price Decimal Position
display.strike_price_decimal_position = function(value)
  return "Strike Price Decimal Position: "..value
end

-- Dissect Strike Price Decimal Position Field
dissect.strike_price_decimal_position = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.strike_price_decimal_position(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.strike_price_decimal_position, range, value, display)

  return offset + size
end

-- Display Price Minimum Tick
display.price_minimum_tick = function(value)
  return "Price Minimum Tick: "..value
end

-- Dissect Price Minimum Tick Field
dissect.price_minimum_tick = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.price_minimum_tick(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.price_minimum_tick, range, value, display)

  return offset + size
end

-- Display Price Fractional Denominator
display.price_fractional_denominator = function(value)
  return "Price Fractional Denominator: "..value
end

-- Dissect Price Fractional Denominator Field
dissect.price_fractional_denominator = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.price_fractional_denominator(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.price_fractional_denominator, range, value, display)

  return offset + size
end

-- Display Price Decimal Position
display.price_decimal_position = function(value)
  return "Price Decimal Position: "..value
end

-- Dissect Price Decimal Position Field
dissect.price_decimal_position = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.price_decimal_position(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.price_decimal_position, range, value, display)

  return offset + size
end

-- Display Underlying Contract Number
display.underlying_contract_number = function(value)
  return "Underlying Contract Number: "..value
end

-- Dissect Underlying Contract Number Field
dissect.underlying_contract_number = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.underlying_contract_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.underlying_contract_number, range, value, display)

  return offset + size
end

-- Display Strike
display.strike = function(value)
  return "Strike: "..value
end

-- Dissect Strike Field
dissect.strike = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.strike(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.strike, range, value, display)

  return offset + size
end

-- Display Field: Option Type
display.option_type = function(value)
  if value == "P" then
    return "Option Type: Put (P)"
  end
  if value == "C" then
    return "Option Type: Call (C)"
  end

  return "Option Type: Unknown("..value..")"
end

-- Dissect Option Type Field
dissect.option_type = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.option_type(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.option_type, range, value, display)

  return offset + size
end

-- Display Expiry Month
display.expiry_month = function(value)
  return "Expiry Month: "..value
end

-- Dissect Expiry Month Field
dissect.expiry_month = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.expiry_month(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.expiry_month, range, value, display)

  return offset + size
end

-- Display Expiry Year
display.expiry_year = function(value)
  return "Expiry Year: "..value
end

-- Dissect Expiry Year Field
dissect.expiry_year = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.expiry_year(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.expiry_year, range, value, display)

  return offset + size
end

-- Display Field: Contract Type
display.contract_type = function(value)
  if value == "F" then
    return "Contract Type: Cfut (F)"
  end
  if value == "O" then
    return "Contract Type: Copta (O)"
  end
  if value == "E" then
    return "Contract Type: Eopta (E)"
  end
  if value == "N" then
    return "Contract Type: Oopt (N)"
  end
  if value == "S" then
    return "Contract Type: Csprd (S)"
  end
  if value == "A" then
    return "Contract Type: Sprd (A)"
  end
  if value == "D" then
    return "Contract Type: Sfut (D)"
  end

  return "Contract Type: Unknown("..value..")"
end

-- Dissect Contract Type Field
dissect.contract_type = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.contract_type(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.contract_type, range, value, display)

  return offset + size
end

-- Display Instrument
display.instrument = function(value)
  return "Instrument: "..value
end

-- Dissect Instrument Field
dissect.instrument = function(buffer, offset, packet, parent)
  local size = 6
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.instrument(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.instrument, range, value, display)

  return offset + size
end

-- Display Exchange
display.exchange = function(value)
  return "Exchange: "..value
end

-- Dissect Exchange Field
dissect.exchange = function(buffer, offset, packet, parent)
  local size = 6
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.exchange(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.exchange, range, value, display)

  return offset + size
end

-- Display function for: Option Symbol Directory
display.option_symbol_directory = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Option Symbol Directory Fields
dissect.option_symbol_directory_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Exchange: 6 Byte Ascii String
  index = dissect.exchange(buffer, index, packet, parent)

  -- Instrument: 6 Byte Ascii String
  index = dissect.instrument(buffer, index, packet, parent)

  -- Contract Type: 1 Byte Ascii String Enum with 7 values
  index = dissect.contract_type(buffer, index, packet, parent)

  -- Expiry Year: 2 Byte Unsigned Fixed Width Integer
  index = dissect.expiry_year(buffer, index, packet, parent)

  -- Expiry Month: 1 Byte Unsigned Fixed Width Integer
  index = dissect.expiry_month(buffer, index, packet, parent)

  -- Option Type: 1 Byte Ascii String Enum with 2 values
  index = dissect.option_type(buffer, index, packet, parent)

  -- Strike: 4 Byte Unsigned Fixed Width Integer
  index = dissect.strike(buffer, index, packet, parent)

  -- Underlying Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.underlying_contract_number(buffer, index, packet, parent)

  -- Price Decimal Position: 1 Byte Unsigned Fixed Width Integer
  index = dissect.price_decimal_position(buffer, index, packet, parent)

  -- Price Fractional Denominator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.price_fractional_denominator(buffer, index, packet, parent)

  -- Price Minimum Tick: 2 Byte Unsigned Fixed Width Integer
  index = dissect.price_minimum_tick(buffer, index, packet, parent)

  -- Strike Price Decimal Position: 1 Byte Unsigned Fixed Width Integer
  index = dissect.strike_price_decimal_position(buffer, index, packet, parent)

  -- Strike Price Fractional Denominator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.strike_price_fractional_denominator(buffer, index, packet, parent)

  -- Strike Price Minimum Tick: 2 Byte Unsigned Fixed Width Integer
  index = dissect.strike_price_minimum_tick(buffer, index, packet, parent)

  -- Last Trading Date: 4 Byte Unsigned Fixed Width Integer
  index = dissect.last_trading_date(buffer, index, packet, parent)

  -- Prior Day Settlement: 4 Byte Signed Fixed Width Integer
  index = dissect.prior_day_settlement(buffer, index, packet, parent)

  -- Volatility: 4 Byte Unsigned Fixed Width Integer
  index = dissect.volatility(buffer, index, packet, parent)

  -- Financial Type: 1 Byte Ascii String Enum with 5 values
  index = dissect.financial_type(buffer, index, packet, parent)

  -- Currency: 3 Byte Ascii String
  index = dissect.currency(buffer, index, packet, parent)

  -- Lot Size or Face Value: 4 Byte Unsigned Fixed Width Integer
  index = dissect.lot_size_or_face_value(buffer, index, packet, parent)

  -- Maturity Value: 1 Byte Unsigned Fixed Width Integer
  index = dissect.maturity_value(buffer, index, packet, parent)

  -- Coupon Rate: 2 Byte Unsigned Fixed Width Integer
  index = dissect.coupon_rate(buffer, index, packet, parent)

  -- Payments per Year: 1 Byte Unsigned Fixed Width Integer
  index = dissect.payments_per_year(buffer, index, packet, parent)

  -- Activated: 1 Byte Ascii String Enum with 2 values
  index = dissect.activated(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Option Symbol Directory
dissect.option_symbol_directory = function(buffer, offset, packet, parent)
  if not show.option_symbol_directory then
    return dissect.option_symbol_directory_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 74)
  local display = display.option_symbol_directory(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.option_symbol_directory, range, display)

  return dissect.option_symbol_directory_fields(buffer, offset, packet, element)
end

-- Display Secondary Ratio
display.secondary_ratio = function(value)
  return "Secondary Ratio: "..value
end

-- Dissect Secondary Ratio Field
dissect.secondary_ratio = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.secondary_ratio(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.secondary_ratio, range, value, display)

  return offset + size
end

-- Display Primary Ratio
display.primary_ratio = function(value)
  return "Primary Ratio: "..value
end

-- Dissect Primary Ratio Field
dissect.primary_ratio = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.primary_ratio(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.primary_ratio, range, value, display)

  return offset + size
end

-- Display Second Leg Contract Number
display.second_leg_contract_number = function(value)
  return "Second Leg Contract Number: "..value
end

-- Dissect Second Leg Contract Number Field
dissect.second_leg_contract_number = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.second_leg_contract_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.second_leg_contract_number, range, value, display)

  return offset + size
end

-- Display First Leg Contract Number
display.first_leg_contract_number = function(value)
  return "First Leg Contract Number: "..value
end

-- Dissect First Leg Contract Number Field
dissect.first_leg_contract_number = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.first_leg_contract_number(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.first_leg_contract_number, range, value, display)

  return offset + size
end

-- Display function for: Spread Symbol Directory
display.spread_symbol_directory = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Spread Symbol Directory Fields
dissect.spread_symbol_directory_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Exchange: 6 Byte Ascii String
  index = dissect.exchange(buffer, index, packet, parent)

  -- Contract Type: 1 Byte Ascii String Enum with 7 values
  index = dissect.contract_type(buffer, index, packet, parent)

  -- First Leg Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.first_leg_contract_number(buffer, index, packet, parent)

  -- Second Leg Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.second_leg_contract_number(buffer, index, packet, parent)

  -- Primary Ratio: 1 Byte Unsigned Fixed Width Integer
  index = dissect.primary_ratio(buffer, index, packet, parent)

  -- Secondary Ratio: 1 Byte Unsigned Fixed Width Integer
  index = dissect.secondary_ratio(buffer, index, packet, parent)

  -- Price Decimal Position: 1 Byte Unsigned Fixed Width Integer
  index = dissect.price_decimal_position(buffer, index, packet, parent)

  -- Price Fractional Denominator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.price_fractional_denominator(buffer, index, packet, parent)

  -- Price Minimum Tick: 2 Byte Unsigned Fixed Width Integer
  index = dissect.price_minimum_tick(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Spread Symbol Directory
dissect.spread_symbol_directory = function(buffer, offset, packet, parent)
  if not show.spread_symbol_directory then
    return dissect.spread_symbol_directory_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 34)
  local display = display.spread_symbol_directory(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.spread_symbol_directory, range, display)

  return dissect.spread_symbol_directory_fields(buffer, offset, packet, element)
end

-- Display function for: Future Symbol Directory
display.future_symbol_directory = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Future Symbol Directory Fields
dissect.future_symbol_directory_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Contract Number: 4 Byte Unsigned Fixed Width Integer
  index = dissect.contract_number(buffer, index, packet, parent)

  -- Exchange: 6 Byte Ascii String
  index = dissect.exchange(buffer, index, packet, parent)

  -- Instrument: 6 Byte Ascii String
  index = dissect.instrument(buffer, index, packet, parent)

  -- Contract Type: 1 Byte Ascii String Enum with 7 values
  index = dissect.contract_type(buffer, index, packet, parent)

  -- Expiry Year: 2 Byte Unsigned Fixed Width Integer
  index = dissect.expiry_year(buffer, index, packet, parent)

  -- Expiry Month: 1 Byte Unsigned Fixed Width Integer
  index = dissect.expiry_month(buffer, index, packet, parent)

  -- Price Decimal Position: 1 Byte Unsigned Fixed Width Integer
  index = dissect.price_decimal_position(buffer, index, packet, parent)

  -- Price Fractional Denominator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.price_fractional_denominator(buffer, index, packet, parent)

  -- Price Minimum Tick: 2 Byte Unsigned Fixed Width Integer
  index = dissect.price_minimum_tick(buffer, index, packet, parent)

  -- Last Trading Date: 4 Byte Unsigned Fixed Width Integer
  index = dissect.last_trading_date(buffer, index, packet, parent)

  -- Prior Day Settlement: 4 Byte Signed Fixed Width Integer
  index = dissect.prior_day_settlement(buffer, index, packet, parent)

  -- Financial Type: 1 Byte Ascii String Enum with 5 values
  index = dissect.financial_type(buffer, index, packet, parent)

  -- Currency: 3 Byte Ascii String
  index = dissect.currency(buffer, index, packet, parent)

  -- Lot Size or Face Value: 4 Byte Unsigned Fixed Width Integer
  index = dissect.lot_size_or_face_value(buffer, index, packet, parent)

  -- Maturity Value: 1 Byte Unsigned Fixed Width Integer
  index = dissect.maturity_value(buffer, index, packet, parent)

  -- Coupon Rate: 2 Byte Unsigned Fixed Width Integer
  index = dissect.coupon_rate(buffer, index, packet, parent)

  -- Payments per Year: 1 Byte Unsigned Fixed Width Integer
  index = dissect.payments_per_year(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Future Symbol Directory
dissect.future_symbol_directory = function(buffer, offset, packet, parent)
  if not show.future_symbol_directory then
    return dissect.future_symbol_directory_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 53)
  local display = display.future_symbol_directory(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.future_symbol_directory, range, display)

  return dissect.future_symbol_directory_fields(buffer, offset, packet, element)
end

-- Display Field: Event Code
display.event_code = function(value)
  if value == "O" then
    return "Event Code: Open (O)"
  end
  if value == "S" then
    return "Event Code: Start (S)"
  end
  if value == "C" then
    return "Event Code: End (C)"
  end
  if value == "P" then
    return "Event Code: Paused (P)"
  end
  if value == "R" then
    return "Event Code: Resumed (R)"
  end

  return "Event Code: Unknown("..value..")"
end

-- Dissect Event Code Field
dissect.event_code = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.event_code(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.event_code, range, value, display)

  return offset + size
end

-- Display function for: System Event
display.system_event = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect System Event Fields
dissect.system_event_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 4 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  -- Trade Date: 2 Byte Unsigned Fixed Width Integer
  index = dissect.trade_date(buffer, index, packet, parent)

  -- Event Code: 1 Byte Ascii String Enum with 5 values
  index = dissect.event_code(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: System Event
dissect.system_event = function(buffer, offset, packet, parent)
  if not show.system_event then
    return dissect.system_event_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 7)
  local display = display.system_event(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.system_event, range, display)

  return dissect.system_event_fields(buffer, offset, packet, element)
end

-- Display Second
display.second = function(value)
  return "Second: "..value
end

-- Dissect Second Field
dissect.second = function(buffer, offset, packet, parent)
  local size = 4
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.second(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.second, range, value, display)

  return offset + size
end

-- Display function for: Time Message
display.time_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Time Message Fields
dissect.time_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Second: 4 Byte Unsigned Fixed Width Integer
  index = dissect.second(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Time Message
dissect.time_message = function(buffer, offset, packet, parent)
  if not show.time_message then
    return dissect.time_message_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 4)
  local display = display.time_message(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.time_message, range, display)

  return dissect.time_message_fields(buffer, offset, packet, element)
end

-- Calculate runtime size of: Payload
calculate.payload = function(buffer, offset, code)
  -- Size of Time Message
  if code == "T" then
    return 4
  end
  -- Size of System Event
  if code == "S" then
    return 7
  end
  -- Size of Future Symbol Directory
  if code == "f" then
    return 53
  end
  -- Size of Spread Symbol Directory
  if code == "g" then
    return 34
  end
  -- Size of Option Symbol Directory
  if code == "h" then
    return 74
  end
  -- Size of Order Book State
  if code == "O" then
    return 11
  end
  -- Size of Order Added
  if code == "A" then
    return 31
  end
  -- Size of Order Replaced
  if code == "U" then
    return 31
  end
  -- Size of Order Volume Cancelled
  if code == "X" then
    return 23
  end
  -- Size of Order Deleted
  if code == "D" then
    return 19
  end
  -- Size of Implied Order Added
  if code == "j" then
    return 31
  end
  -- Size of Implied Order Replaced
  if code == "l" then
    return 31
  end
  -- Size of Implied Order Deleted
  if code == "k" then
    return 19
  end
  -- Size of Custom Market Order Added
  if code == "m" then
    return 89
  end
  -- Size of Custom Market Order Replaced
  if code == "n" then
    return 22
  end
  -- Size of Custom Market Order Deleted
  if code == "r" then
    return 14
  end
  -- Size of Order Executed
  if code == "E" then
    return 36
  end
  -- Size of Order Executed with Price
  if code == "C" then
    return 47
  end
  -- Size of Spread Executed
  if code == "e" then
    return 46
  end
  -- Size of Trade Spread Execution Chain
  if code == "P" then
    return 62
  end
  -- Size of Custom Market Executed
  if code == "u" then
    return 37
  end
  -- Size of Custom Market Trade
  if code == "p" then
    return 54
  end
  -- Size of Trade Cancellation
  if code == "B" then
    return 10
  end
  -- Size of Equilibrium Price Auction Info
  if code == "Z" then
    return 30
  end
  -- Size of Open, High, Low, Last Trade Adjustment
  if code == "t" then
    return 40
  end
  -- Size of Market Settlement
  if code == "Y" then
    return 19
  end
  -- Size of Ad Hoc Text Message
  if code == "x" then
    return 112
  end
  -- Size of Request for Quote
  if code == "q" then
    return 18
  end
  -- Size of Anomalous Order Threshold Publish
  if code == "W" then
    return 34
  end
  -- Size of Volume and Open Interest
  if code == "V" then
    return 20
  end

  -- Report error
  error("Unknown Type: "..code)

  return 0
end

-- Display function for Branch: Payload
display.payload = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches:
dissect.payload_branches = function(code, buffer, offset, packet, parent)
  -- Dissect Time Message
  if code == "T" then
    return dissect.time_message(buffer, offset, packet, parent)
  end
  -- Dissect System Event
  if code == "S" then
    return dissect.system_event(buffer, offset, packet, parent)
  end
  -- Dissect Future Symbol Directory
  if code == "f" then
    return dissect.future_symbol_directory(buffer, offset, packet, parent)
  end
  -- Dissect Spread Symbol Directory
  if code == "g" then
    return dissect.spread_symbol_directory(buffer, offset, packet, parent)
  end
  -- Dissect Option Symbol Directory
  if code == "h" then
    return dissect.option_symbol_directory(buffer, offset, packet, parent)
  end
  -- Dissect Order Book State
  if code == "O" then
    return dissect.order_book_state(buffer, offset, packet, parent)
  end
  -- Dissect Order Added
  if code == "A" then
    return dissect.order_added(buffer, offset, packet, parent)
  end
  -- Dissect Order Replaced
  if code == "U" then
    return dissect.order_replaced(buffer, offset, packet, parent)
  end
  -- Dissect Order Volume Cancelled
  if code == "X" then
    return dissect.order_volume_cancelled(buffer, offset, packet, parent)
  end
  -- Dissect Order Deleted
  if code == "D" then
    return dissect.order_deleted(buffer, offset, packet, parent)
  end
  -- Dissect Implied Order Added
  if code == "j" then
    return dissect.implied_order_added(buffer, offset, packet, parent)
  end
  -- Dissect Implied Order Replaced
  if code == "l" then
    return dissect.implied_order_replaced(buffer, offset, packet, parent)
  end
  -- Dissect Implied Order Deleted
  if code == "k" then
    return dissect.implied_order_deleted(buffer, offset, packet, parent)
  end
  -- Dissect Custom Market Order Added
  if code == "m" then
    return dissect.custom_market_order_added(buffer, offset, packet, parent)
  end
  -- Dissect Custom Market Order Replaced
  if code == "n" then
    return dissect.custom_market_order_replaced(buffer, offset, packet, parent)
  end
  -- Dissect Custom Market Order Deleted
  if code == "r" then
    return dissect.custom_market_order_deleted(buffer, offset, packet, parent)
  end
  -- Dissect Order Executed
  if code == "E" then
    return dissect.order_executed(buffer, offset, packet, parent)
  end
  -- Dissect Order Executed with Price
  if code == "C" then
    return dissect.order_executed_with_price(buffer, offset, packet, parent)
  end
  -- Dissect Spread Executed
  if code == "e" then
    return dissect.spread_executed(buffer, offset, packet, parent)
  end
  -- Dissect Trade Spread Execution Chain
  if code == "P" then
    return dissect.trade_spread_execution_chain(buffer, offset, packet, parent)
  end
  -- Dissect Custom Market Executed
  if code == "u" then
    return dissect.custom_market_executed(buffer, offset, packet, parent)
  end
  -- Dissect Custom Market Trade
  if code == "p" then
    return dissect.custom_market_trade(buffer, offset, packet, parent)
  end
  -- Dissect Trade Cancellation
  if code == "B" then
    return dissect.trade_cancellation(buffer, offset, packet, parent)
  end
  -- Dissect Equilibrium Price Auction Info
  if code == "Z" then
    return dissect.equilibrium_price_auction_info(buffer, offset, packet, parent)
  end
  -- Dissect Open, High, Low, Last Trade Adjustment
  if code == "t" then
    return dissect.open__high__low__last_trade_adjustment(buffer, offset, packet, parent)
  end
  -- Dissect Market Settlement
  if code == "Y" then
    return dissect.market_settlement(buffer, offset, packet, parent)
  end
  -- Dissect Ad Hoc Text Message
  if code == "x" then
    return dissect.ad_hoc_text_message(buffer, offset, packet, parent)
  end
  -- Dissect Request for Quote
  if code == "q" then
    return dissect.request_for_quote(buffer, offset, packet, parent)
  end
  -- Dissect Anomalous Order Threshold Publish
  if code == "W" then
    return dissect.anomalous_order_threshold_publish(buffer, offset, packet, parent)
  end
  -- Dissect Volume and Open Interest
  if code == "V" then
    return dissect.volume_and_open_interest(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Payload
dissect.payload = function(buffer, offset, packet, parent)
  -- Parse payload type dependency
  local code = buffer(offset - 1, 1):string()

  if not show.payload then
    return dissect.payload_branches(code, buffer, offset, packet, parent)
  end

  -- Calculate size and check that branch is not empty
  local size = calculate.payload(buffer, offset, code)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = display.payload(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.payload, range, display)

  return dissect.payload_branches(code, buffer, offset, packet, element)
end

-- Display Field: Message Type
display.message_type = function(value)
  if value == "T" then
    return "Message Type: Time Message (T)"
  end
  if value == "S" then
    return "Message Type: System Event (S)"
  end
  if value == "f" then
    return "Message Type: Future Symbol Directory (f)"
  end
  if value == "g" then
    return "Message Type: Spread Symbol Directory (g)"
  end
  if value == "h" then
    return "Message Type: Option Symbol Directory (h)"
  end
  if value == "O" then
    return "Message Type: Order Book State (O)"
  end
  if value == "A" then
    return "Message Type: Order Added (A)"
  end
  if value == "U" then
    return "Message Type: Order Replaced (U)"
  end
  if value == "X" then
    return "Message Type: Order Volume Cancelled (X)"
  end
  if value == "D" then
    return "Message Type: Order Deleted (D)"
  end
  if value == "j" then
    return "Message Type: Implied Order Added (j)"
  end
  if value == "l" then
    return "Message Type: Implied Order Replaced (l)"
  end
  if value == "k" then
    return "Message Type: Implied Order Deleted (k)"
  end
  if value == "m" then
    return "Message Type: Custom Market Order Added (m)"
  end
  if value == "n" then
    return "Message Type: Custom Market Order Replaced (n)"
  end
  if value == "r" then
    return "Message Type: Custom Market Order Deleted (r)"
  end
  if value == "E" then
    return "Message Type: Order Executed (E)"
  end
  if value == "C" then
    return "Message Type: Order Executed with Price (C)"
  end
  if value == "e" then
    return "Message Type: Spread Executed (e)"
  end
  if value == "P" then
    return "Message Type: Trade Spread Execution Chain (P)"
  end
  if value == "u" then
    return "Message Type: Custom Market Executed (u)"
  end
  if value == "p" then
    return "Message Type: Custom Market Trade (p)"
  end
  if value == "B" then
    return "Message Type: Trade Cancellation (B)"
  end
  if value == "Z" then
    return "Message Type: Equilibrium Price Auction Info (Z)"
  end
  if value == "t" then
    return "Message Type: Open, High, Low, Last Trade Adjustment (t)"
  end
  if value == "Y" then
    return "Message Type: Market Settlement (Y)"
  end
  if value == "x" then
    return "Message Type: Ad Hoc Text Message (x)"
  end
  if value == "q" then
    return "Message Type: Request for Quote (q)"
  end
  if value == "W" then
    return "Message Type: Anomalous Order Threshold Publish (W)"
  end
  if value == "V" then
    return "Message Type: Volume and Open Interest (V)"
  end

  return "Message Type: Unknown("..value..")"
end

-- Dissect Message Type Field
dissect.message_type = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.message_type(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.message_type, range, value, display)

  return offset + size
end

-- Display Length
display.length = function(value)
  return "Length: "..value
end

-- Dissect Length Field
dissect.length = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.length(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.length, range, value, display)

  return offset + size
end

-- Display function for: Message Header
display.message_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Message Header Fields
dissect.message_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Length: 2 Byte Unsigned Fixed Width Integer
  index = dissect.length(buffer, index, packet, parent)

  -- Message Type: 1 Byte Ascii String Enum with 30 values
  index = dissect.message_type(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Message Header
dissect.message_header = function(buffer, offset, packet, parent)
  if not show.message_header then
    return dissect.message_header_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 3)
  local display = display.message_header(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.message_header, range, display)

  return dissect.message_header_fields(buffer, offset, packet, element)
end

-- Calculate runtime size: Message
calculate.message = function(buffer, offset)
  local index = 0

  index = index + 3

  -- Calculate runtime size of Payload field
  local payload_offset = offset + index
  local payload_type = buffer(payload_offset - 1, 1):string()
  index = index + calculate.payload(buffer, payload_offset, payload_type)

  return index
end

-- Display function for: Message
display.message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Message Fields
dissect.message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Header: Struct of 2 fields
  index = dissect.message_header(buffer, index, packet, parent)

  -- Payload: Runtime Type with 30 branches
  index = dissect.payload(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Message
dissect.message = function(buffer, offset, packet, parent)
  if not show.message then
    return dissect.message_fields(buffer, offset, packet, parent)
  end

  local size = calculate.message(buffer, offset)
  local range = buffer(offset, size)
  local display = display.message(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.message, range, display)

  return dissect.message_fields(buffer, offset, packet, element)
end

-- Display Count
display.count = function(value)
  return "Count: "..value
end

-- Dissect Count Field
dissect.count = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:uint()
  local display = display.count(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.count, range, value, display)

  return offset + size
end

-- Display Sequence
display.sequence = function(value)
  return "Sequence: "..value
end

-- Dissect Sequence Field
dissect.sequence = function(buffer, offset, packet, parent)
  local size = 8
  local range = buffer(offset, size)
  local value = range:uint64()
  local display = display.sequence(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.sequence, range, value, display)

  return offset + size
end

-- Display Trading Service
display.trading_service = function(value)
  return "Trading Service: "..value
end

-- Dissect Trading Service Field
dissect.trading_service = function(buffer, offset, packet, parent)
  local size = 3
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.trading_service(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.trading_service, range, value, display)

  return offset + size
end

-- Display Session Week
display.session_week = function(value)
  return "Session Week: "..value
end

-- Dissect Session Week Field
dissect.session_week = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.session_week(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.session_week, range, value, display)

  return offset + size
end

-- Display Session Year
display.session_year = function(value)
  return "Session Year: "..value
end

-- Dissect Session Year Field
dissect.session_year = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.session_year(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.session_year, range, value, display)

  return offset + size
end

-- Display Protocol Version
display.protocol_version = function(value)
  return "Protocol Version: "..value
end

-- Dissect Protocol Version Field
dissect.protocol_version = function(buffer, offset, packet, parent)
  local size = 3
  local range = buffer(offset, size)
  local value = range:string()
  local display = display.protocol_version(value, buffer, offset, packet, parent)

  parent:add(asx_itch_mdp_2_4_0.fields.protocol_version, range, value, display)

  return offset + size
end

-- Display function for Session
display.session = function(buffer, packet, parent)
  return buffer(0, 10):string()
end

-- Dissect Session Fields
dissect.session_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Protocol Version: 3 Byte Ascii String
  index = dissect.protocol_version(buffer, index, packet, parent)

  -- Session Year: 2 Byte Ascii String
  index = dissect.session_year(buffer, index, packet, parent)

  -- Session Week: 2 Byte Ascii String
  index = dissect.session_week(buffer, index, packet, parent)

  -- Trading Service: 3 Byte Ascii String
  index = dissect.trading_service(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Session
dissect.session = function(buffer, offset, packet, parent)
  if not show.session then
    return dissect.session_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 10)
  local display = display.session(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.session, range, display)

  return dissect.session_fields(buffer, offset, packet, element)
end

-- Display function for: Packet Header
display.packet_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Packet Header Fields
dissect.packet_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Session: 10 Byte Ascii String: Struct of 4 fields
  index = dissect.session(buffer, index, packet, parent)

  -- Sequence: 8 Byte Unsigned Fixed Width Integer
  index = dissect.sequence(buffer, index, packet, parent)

  -- Count: 2 Byte Unsigned Fixed Width Integer
  index = dissect.count(buffer, index, packet, parent)

  return index
end

-- Dissect Struct: Packet Header
dissect.packet_header = function(buffer, offset, packet, parent)
  if not show.packet_header then
    return dissect.packet_header_fields(buffer, offset, packet, parent)
  end

  local range = buffer(offset, 20)
  local display = display.packet_header(buffer, packet, parent)
  local element = parent:add(asx_itch_mdp_2_4_0.fields.packet_header, range, display)

  return dissect.packet_header_fields(buffer, offset, packet, element)
end

-- Dissect Packet
function dissect.packet(buffer, packet, parent)
  local index = 0

  -- Packet Header: Struct of 3 fields
  index = dissect.packet_header(buffer, index, packet, parent)

  -- Message: Struct of 2 fields
  while index < buffer:len() do
    index = dissect.message(buffer, index, packet, parent)
  end

  return index
end


-----------------------------------------------------------------------
-- Protocol Dissector and Components
-----------------------------------------------------------------------

-- Initialize Dissector
function asx_itch_mdp_2_4_0.init()
end

-- Dissector for Asx Itch Mdp 2.4.0
function asx_itch_mdp_2_4_0.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = asx_itch_mdp_2_4_0.name

  -- Dissect protocol
  local protocol = parent:add(asx_itch_mdp_2_4_0, buffer(), asx_itch_mdp_2_4_0.description, "("..buffer:len().." Bytes)")
  local protocol_size = dissect.packet(buffer, packet, protocol)
end

-- Register With Udp Table
local udp_table = DissectorTable.get("udp.port")
udp_table:add(65333, asx_itch_mdp_2_4_0)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.asx_itch_mdp_2_4_0_packet_size = function(buffer)

  return true
end

-- Dissector Heuristic for Asx Itch Mdp 2.4.0
local function asx_itch_mdp_2_4_0_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.asx_itch_mdp_2_4_0_packet_size(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = asx_itch_mdp_2_4_0
  asx_itch_mdp_2_4_0.dissector(buffer, packet, parent)

  return true
end

-- Register Asx Itch Mdp 2.4.0 Heuristic
asx_itch_mdp_2_4_0:register_heuristic("udp", asx_itch_mdp_2_4_0_heuristic)

-----------------------------------------------------------------------
-- This file was generated by a tool for the open markets initiative
-- Protocol Version: 2.4.0
-- Script Version: 1.0.0.0
-- Date:
-- License: Public/GPLv3
-- Authors: Omi Developers
-- 
-- This script dissector is provided as an easily edited and modified
-- cross platform dissection solution. Feel free to modify. Enjoy.
-----------------------------------------------------------------------
