-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Ice Mdf iMpact 1.1.33 Protocol
local ice_mdf_impact_v1_1_33 = Proto("Ice.Mdf.iMpact.v1.1.33.Lua", "Ice Mdf iMpact 1.1.33")

-- Component Tables
local show = {}
local format = {}
local display = {}
local dissect = {}
local size_of = {}
local verify = {}

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Ice Mdf iMpact 1.1.33 Fields
ice_mdf_impact_v1_1_33.fields.add_or_modify_order_message = ProtoField.new("Add or Modify Order Message", "ice.mdf.impact.v1.1.33.addormodifyordermessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.add_price_level_message = ProtoField.new("Add Price Level Message", "ice.mdf.impact.v1.1.33.addpricelevelmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.agg__bid__qty = ProtoField.new("Agg  Bid  Qty", "ice.mdf.impact.v1.1.33.aggbidqty", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.agg__offer__qty = ProtoField.new("Agg  Offer  Qty", "ice.mdf.impact.v1.1.33.aggofferqty", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.aggressor_side = ProtoField.new("Aggressor Side", "ice.mdf.impact.v1.1.33.aggressorside", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.allow_options = ProtoField.new("Allow Options", "ice.mdf.impact.v1.1.33.allowoptions", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.allows_implied = ProtoField.new("Allows Implied", "ice.mdf.impact.v1.1.33.allowsimplied", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.auction__date = ProtoField.new("Auction  Date", "ice.mdf.impact.v1.1.33.auctiondate", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.auction_end_time = ProtoField.new("Auction End Time", "ice.mdf.impact.v1.1.33.auctionendtime", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.begin_day = ProtoField.new("Begin Day", "ice.mdf.impact.v1.1.33.beginday", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.begin_month = ProtoField.new("Begin Month", "ice.mdf.impact.v1.1.33.beginmonth", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.begin_year = ProtoField.new("Begin Year", "ice.mdf.impact.v1.1.33.beginyear", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.block_volume = ProtoField.new("Block Volume", "ice.mdf.impact.v1.1.33.blockvolume", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.cancelled_trade_message = ProtoField.new("Cancelled Trade Message", "ice.mdf.impact.v1.1.33.cancelledtrademessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.change_price_level_message = ProtoField.new("Change Price Level Message", "ice.mdf.impact.v1.1.33.changepricelevelmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.cleared_alias = ProtoField.new("Cleared Alias", "ice.mdf.impact.v1.1.33.clearedalias", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.close_price = ProtoField.new("Close Price", "ice.mdf.impact.v1.1.33.closeprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.close_price_message = ProtoField.new("Close Price Message", "ice.mdf.impact.v1.1.33.closepricemessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.contract_symbol = ProtoField.new("Contract Symbol", "ice.mdf.impact.v1.1.33.contractsymbol", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.contract_symbol_extra = ProtoField.new("Contract Symbol Extra", "ice.mdf.impact.v1.1.33.contractsymbolextra", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.count = ProtoField.new("Count", "ice.mdf.impact.v1.1.33.count", ftypes.UINT16)
ice_mdf_impact_v1_1_33.fields.cross_order_supported = ProtoField.new("Cross Order Supported", "ice.mdf.impact.v1.1.33.crossordersupported", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.currency = ProtoField.new("Currency", "ice.mdf.impact.v1.1.33.currency", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.date_time = ProtoField.new("Date Time", "ice.mdf.impact.v1.1.33.datetime", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.deal_price_denominator = ProtoField.new("Deal Price Denominator", "ice.mdf.impact.v1.1.33.dealpricedenominator", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.delete_order_message = ProtoField.new("Delete Order Message", "ice.mdf.impact.v1.1.33.deleteordermessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.delete_price_level_message = ProtoField.new("Delete Price Level Message", "ice.mdf.impact.v1.1.33.deletepricelevelmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.delivery_begin_date_time = ProtoField.new("Delivery Begin Date Time", "ice.mdf.impact.v1.1.33.deliverybegindatetime", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.delivery_end_date_time = ProtoField.new("Delivery End Date Time", "ice.mdf.impact.v1.1.33.deliveryenddatetime", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.delta = ProtoField.new("Delta", "ice.mdf.impact.v1.1.33.delta", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.description = ProtoField.new("Description", "ice.mdf.impact.v1.1.33.description", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.efp_volume = ProtoField.new("EFP Volume", "ice.mdf.impact.v1.1.33.efpvolume", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.efs_volume = ProtoField.new("EFS Volume", "ice.mdf.impact.v1.1.33.efsvolume", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.end_day = ProtoField.new("End Day", "ice.mdf.impact.v1.1.33.endday", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.end_month = ProtoField.new("End Month", "ice.mdf.impact.v1.1.33.endmonth", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.end_of_day_market_summary_message = ProtoField.new("End of Day Market Summary Message", "ice.mdf.impact.v1.1.33.endofdaymarketsummarymessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.end_year = ProtoField.new("End Year", "ice.mdf.impact.v1.1.33.endyear", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.eur__price = ProtoField.new("EUR  Price", "ice.mdf.impact.v1.1.33.eurprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.event_type = ProtoField.new("Event Type", "ice.mdf.impact.v1.1.33.eventtype", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.exchange_silo = ProtoField.new("Exchange Silo", "ice.mdf.impact.v1.1.33.exchangesilo", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.extra_flags = ProtoField.new("Extra Flags", "ice.mdf.impact.v1.1.33.extraflags", ftypes.INT8, {[1]="Yes",[0]="No"})
ice_mdf_impact_v1_1_33.fields.fixing_indicative_price_message__message = ProtoField.new("Fixing Indicative Price Message  Message", "ice.mdf.impact.v1.1.33.fixingindicativepricemessagemessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.fixing_lockdown_message = ProtoField.new("Fixing Lockdown Message", "ice.mdf.impact.v1.1.33.fixinglockdownmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.fixing_transition_message = ProtoField.new("Fixing Transition Message", "ice.mdf.impact.v1.1.33.fixingtransitionmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.flex_allowed = ProtoField.new("Flex Allowed", "ice.mdf.impact.v1.1.33.flexallowed", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.futures_contract_symbol = ProtoField.new("Futures Contract Symbol", "ice.mdf.impact.v1.1.33.futurescontractsymbol", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.gbp__price = ProtoField.new("GBP  Price", "ice.mdf.impact.v1.1.33.gbpprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.gt_allowed = ProtoField.new("GT Allowed", "ice.mdf.impact.v1.1.33.gtallowed", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.guaranteed_cross_supported = ProtoField.new("Guaranteed Cross Supported", "ice.mdf.impact.v1.1.33.guaranteedcrosssupported", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.has_pre_open_volume = ProtoField.new("Has Pre Open Volume", "ice.mdf.impact.v1.1.33.haspreopenvolume", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.has_previous_day_settlement_price = ProtoField.new("Has Previous Day Settlement Price", "ice.mdf.impact.v1.1.33.haspreviousdaysettlementprice", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.hedge_body_length = ProtoField.new("Hedge Body Length", "ice.mdf.impact.v1.1.33.hedgebodylength", ftypes.UINT8)
ice_mdf_impact_v1_1_33.fields.hedge_definition = ProtoField.new("Hedge Definition", "ice.mdf.impact.v1.1.33.hedgedefinition", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.hedge_delta = ProtoField.new("Hedge Delta", "ice.mdf.impact.v1.1.33.hedgedelta", ftypes.UINT16)
ice_mdf_impact_v1_1_33.fields.hedge_market_id = ProtoField.new("Hedge Market Id", "ice.mdf.impact.v1.1.33.hedgemarketid", ftypes.UINT32)
ice_mdf_impact_v1_1_33.fields.hedge_market_id = ProtoField.new("Hedge Market ID", "ice.mdf.impact.v1.1.33.hedgemarketid", ftypes.UINT32)
ice_mdf_impact_v1_1_33.fields.hedge_only = ProtoField.new("Hedge Only", "ice.mdf.impact.v1.1.33.hedgeonly", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.hedge_price = ProtoField.new("Hedge Price", "ice.mdf.impact.v1.1.33.hedgeprice", ftypes.UINT64)
ice_mdf_impact_v1_1_33.fields.hedge_price_denominator = ProtoField.new("Hedge Price Denominator", "ice.mdf.impact.v1.1.33.hedgepricedenominator", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.hedge_security_type = ProtoField.new("Hedge Security Type", "ice.mdf.impact.v1.1.33.hedgesecuritytype", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.hedge_side = ProtoField.new("Hedge Side", "ice.mdf.impact.v1.1.33.hedgeside", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.hedge_strategy_code = ProtoField.new("Hedge Strategy Code", "ice.mdf.impact.v1.1.33.hedgestrategycode", ftypes.UINT16)
ice_mdf_impact_v1_1_33.fields.high = ProtoField.new("High", "ice.mdf.impact.v1.1.33.high", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.hub_alias = ProtoField.new("Hub Alias", "ice.mdf.impact.v1.1.33.hubalias", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.hub_id = ProtoField.new("Hub ID", "ice.mdf.impact.v1.1.33.hubid", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.iba_currency = ProtoField.new("Iba Currency", "ice.mdf.impact.v1.1.33.ibacurrency", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.implied_order_count = ProtoField.new("Implied Order Count", "ice.mdf.impact.v1.1.33.impliedordercount", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.implied_quantity = ProtoField.new("Implied Quantity", "ice.mdf.impact.v1.1.33.impliedquantity", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.increment_premium_price = ProtoField.new("Increment Premium Price", "ice.mdf.impact.v1.1.33.incrementpremiumprice", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.increment_price = ProtoField.new("Increment Price", "ice.mdf.impact.v1.1.33.incrementprice", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.increment_qty = ProtoField.new("Increment Qty", "ice.mdf.impact.v1.1.33.incrementqty", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.index_prices_message = ProtoField.new("Index Prices Message", "ice.mdf.impact.v1.1.33.indexpricesmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.interval_price_limit_notification_message = ProtoField.new("Interval Price Limit Notification Message", "ice.mdf.impact.v1.1.33.intervalpricelimitnotificationmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.investigated_trade_message = ProtoField.new("Investigated Trade Message", "ice.mdf.impact.v1.1.33.investigatedtrademessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.investigation__status = ProtoField.new("Investigation  Status", "ice.mdf.impact.v1.1.33.investigationstatus", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.ipl_down = ProtoField.new("IPL Down", "ice.mdf.impact.v1.1.33.ipldown", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.ipl_hold_duration = ProtoField.new("Ipl Hold Duration", "ice.mdf.impact.v1.1.33.iplholdduration", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.ipl_hold_type = ProtoField.new("IPL Hold Type", "ice.mdf.impact.v1.1.33.iplholdtype", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.ipl_up = ProtoField.new("Ipl Up", "ice.mdf.impact.v1.1.33.iplup", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.is_adjusted_trade = ProtoField.new("Is Adjusted Trade", "ice.mdf.impact.v1.1.33.isadjustedtrade", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.is_balanced = ProtoField.new("Is Balanced", "ice.mdf.impact.v1.1.33.isbalanced", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.is_block_only = ProtoField.new("Is Block Only", "ice.mdf.impact.v1.1.33.isblockonly", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.is_final = ProtoField.new("Is Final", "ice.mdf.impact.v1.1.33.isfinal", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.is_implied = ProtoField.new("Is Implied", "ice.mdf.impact.v1.1.33.isimplied", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.is_implied_spread_at_market_open = ProtoField.new("Is Implied Spread At Market Open", "ice.mdf.impact.v1.1.33.isimpliedspreadatmarketopen", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.is_official = ProtoField.new("Is Official", "ice.mdf.impact.v1.1.33.isofficial", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.is_rfq = ProtoField.new("Is RFQ", "ice.mdf.impact.v1.1.33.isrfq", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.is_settle_price_official = ProtoField.new("Is Settle Price Official", "ice.mdf.impact.v1.1.33.issettlepriceofficial", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.is_system_priced_leg = ProtoField.new("Is System Priced Leg", "ice.mdf.impact.v1.1.33.issystempricedleg", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.is_tradable = ProtoField.new("Is Tradable", "ice.mdf.impact.v1.1.33.istradable", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.is_up = ProtoField.new("Is Up", "ice.mdf.impact.v1.1.33.isup", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.isin = ProtoField.new("ISIN", "ice.mdf.impact.v1.1.33.isin", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.last_message_sequence_id = ProtoField.new("Last Message Sequence ID", "ice.mdf.impact.v1.1.33.lastmessagesequenceid", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.last_trade_date_time = ProtoField.new("Last Trade Date Time", "ice.mdf.impact.v1.1.33.lasttradedatetime", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.last_trade_price = ProtoField.new("Last Trade Price", "ice.mdf.impact.v1.1.33.lasttradeprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.last_trade_quantity = ProtoField.new("Last Trade Quantity", "ice.mdf.impact.v1.1.33.lasttradequantity", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.leg_body_length = ProtoField.new("Leg Body Length", "ice.mdf.impact.v1.1.33.legbodylength", ftypes.UINT8)
ice_mdf_impact_v1_1_33.fields.leg_deal_suppressed = ProtoField.new("Leg Deal Suppressed", "ice.mdf.impact.v1.1.33.legdealsuppressed", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.leg_definition = ProtoField.new("Leg Definition", "ice.mdf.impact.v1.1.33.legdefinition", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.leg_market_id = ProtoField.new("Leg Market Id", "ice.mdf.impact.v1.1.33.legmarketid", ftypes.UINT32)
ice_mdf_impact_v1_1_33.fields.leg_ratio = ProtoField.new("Leg Ratio", "ice.mdf.impact.v1.1.33.legratio", ftypes.UINT16)
ice_mdf_impact_v1_1_33.fields.leg_ratio_price_denominator = ProtoField.new("Leg Ratio Price Denominator", "ice.mdf.impact.v1.1.33.legratiopricedenominator", ftypes.UINT32)
ice_mdf_impact_v1_1_33.fields.leg_ratio_price_numerator = ProtoField.new("Leg Ratio Price Numerator", "ice.mdf.impact.v1.1.33.legratiopricenumerator", ftypes.UINT32)
ice_mdf_impact_v1_1_33.fields.leg_ratio_qty_denominator = ProtoField.new("Leg Ratio Qty Denominator", "ice.mdf.impact.v1.1.33.legratioqtydenominator", ftypes.UINT32)
ice_mdf_impact_v1_1_33.fields.leg_ratio_qty_numerator = ProtoField.new("Leg Ratio Qty Numerator", "ice.mdf.impact.v1.1.33.legratioqtynumerator", ftypes.UINT32)
ice_mdf_impact_v1_1_33.fields.leg_side = ProtoField.new("Leg Side", "ice.mdf.impact.v1.1.33.legside", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.leg_strategy_code = ProtoField.new("Leg Strategy Code", "ice.mdf.impact.v1.1.33.legstrategycode", ftypes.UINT16)
ice_mdf_impact_v1_1_33.fields.leg_underlying_market_id = ProtoField.new("Leg Underlying Market Id", "ice.mdf.impact.v1.1.33.legunderlyingmarketid", ftypes.UINT32)
ice_mdf_impact_v1_1_33.fields.length = ProtoField.new("Length", "ice.mdf.impact.v1.1.33.length", ftypes.UINT16)
ice_mdf_impact_v1_1_33.fields.lot_size = ProtoField.new("Lot Size", "ice.mdf.impact.v1.1.33.lotsize", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.low = ProtoField.new("Low", "ice.mdf.impact.v1.1.33.low", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.market_desc = ProtoField.new("Market Desc", "ice.mdf.impact.v1.1.33.marketdesc", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.market_event_message = ProtoField.new("Market Event Message", "ice.mdf.impact.v1.1.33.marketeventmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.market_id = ProtoField.new("Market ID", "ice.mdf.impact.v1.1.33.marketid", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.market_snapshot_message = ProtoField.new("Market Snapshot Message", "ice.mdf.impact.v1.1.33.marketsnapshotmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.market_snapshot_order_message = ProtoField.new("Market Snapshot Order Message", "ice.mdf.impact.v1.1.33.marketsnapshotordermessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.market_snapshot_price_level_message = ProtoField.new("Market Snapshot Price Level Message", "ice.mdf.impact.v1.1.33.marketsnapshotpricelevelmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.market_state_change_message = ProtoField.new("Market State Change Message", "ice.mdf.impact.v1.1.33.marketstatechangemessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.market_statistics_message = ProtoField.new("Market Statistics Message", "ice.mdf.impact.v1.1.33.marketstatisticsmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.market_type = ProtoField.new("Market Type", "ice.mdf.impact.v1.1.33.markettype", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.market_type_id = ProtoField.new("Market Type ID", "ice.mdf.impact.v1.1.33.markettypeid", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.maturity_day = ProtoField.new("Maturity Day", "ice.mdf.impact.v1.1.33.maturityday", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.maturity_month = ProtoField.new("Maturity Month", "ice.mdf.impact.v1.1.33.maturitymonth", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.maturity_year = ProtoField.new("Maturity Year", "ice.mdf.impact.v1.1.33.maturityyear", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.max_options_price = ProtoField.new("Max Options Price", "ice.mdf.impact.v1.1.33.maxoptionsprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.max_price = ProtoField.new("Max Price", "ice.mdf.impact.v1.1.33.maxprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.message = ProtoField.new("Message", "ice.mdf.impact.v1.1.33.message", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.message_bundle_marker = ProtoField.new("Message Bundle Marker", "ice.mdf.impact.v1.1.33.messagebundlemarker", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.message_header = ProtoField.new("Message Header", "ice.mdf.impact.v1.1.33.messageheader", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.message_timestamp = ProtoField.new("Message Timestamp", "ice.mdf.impact.v1.1.33.messagetimestamp", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.message_type = ProtoField.new("Message Type", "ice.mdf.impact.v1.1.33.messagetype", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.mic_code = ProtoField.new("MIC Code", "ice.mdf.impact.v1.1.33.miccode", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.mifid_regulated_market = ProtoField.new("MIFID Regulated Market", "ice.mdf.impact.v1.1.33.mifidregulatedmarket", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.min_options_price = ProtoField.new("Min Options Price", "ice.mdf.impact.v1.1.33.minoptionsprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.min_price = ProtoField.new("Min Price", "ice.mdf.impact.v1.1.33.minprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.min_qty = ProtoField.new("Min Qty", "ice.mdf.impact.v1.1.33.minqty", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.modification_timestamp = ProtoField.new("Modification Timestamp", "ice.mdf.impact.v1.1.33.modificationtimestamp", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.new_expiry_message = ProtoField.new("New Expiry Message", "ice.mdf.impact.v1.1.33.newexpirymessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.new_futures_strategy_definition_message = ProtoField.new("New Futures Strategy Definition Message", "ice.mdf.impact.v1.1.33.newfuturesstrategydefinitionmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.new_options_market_definition_message = ProtoField.new("New Options Market Definition Message", "ice.mdf.impact.v1.1.33.newoptionsmarketdefinitionmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.new_options_strategy_definition_message = ProtoField.new("New Options Strategy Definition Message", "ice.mdf.impact.v1.1.33.newoptionsstrategydefinitionmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.notification_date_time = ProtoField.new("Notification Date Time", "ice.mdf.impact.v1.1.33.notificationdatetime", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.num_decimals_options_price = ProtoField.new("Num Decimals Options Price", "ice.mdf.impact.v1.1.33.numdecimalsoptionsprice", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.num_decimals_price = ProtoField.new("Num Decimals Price", "ice.mdf.impact.v1.1.33.numdecimalsprice", ftypes.INT8, {[1]="Yes",[0]="No"})
ice_mdf_impact_v1_1_33.fields.num_decimals_price_in_gram = ProtoField.new("Num Decimals Price In Gram", "ice.mdf.impact.v1.1.33.numdecimalspriceingram", ftypes.INT8, {[1]="Yes",[0]="No"})
ice_mdf_impact_v1_1_33.fields.num_decimals_strike_price = ProtoField.new("Num Decimals Strike Price", "ice.mdf.impact.v1.1.33.numdecimalsstrikeprice", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.num_of_book_entries = ProtoField.new("Num Of Book Entries", "ice.mdf.impact.v1.1.33.numofbookentries", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.number_of_hedge_definitions = ProtoField.new("Number Of Hedge Definitions", "ice.mdf.impact.v1.1.33.numberofhedgedefinitions", ftypes.INT8, {[1]="Yes",[0]="No"})
ice_mdf_impact_v1_1_33.fields.number_of_leg_definitions = ProtoField.new("Number Of Leg Definitions", "ice.mdf.impact.v1.1.33.numberoflegdefinitions", ftypes.INT8, {[1]="Yes",[0]="No"})
ice_mdf_impact_v1_1_33.fields.number_of_special_fields = ProtoField.new("Number Of Special Fields", "ice.mdf.impact.v1.1.33.numberofspecialfields", ftypes.INT8, {[1]="Yes",[0]="No"})
ice_mdf_impact_v1_1_33.fields.number_of_strategy_leg_definitions = ProtoField.new("Number Of Strategy Leg Definitions", "ice.mdf.impact.v1.1.33.numberofstrategylegdefinitions", ftypes.INT8, {[1]="Yes",[0]="No"})
ice_mdf_impact_v1_1_33.fields.off_exchange_increment_option_price = ProtoField.new("Off Exchange Increment Option Price", "ice.mdf.impact.v1.1.33.offexchangeincrementoptionprice", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.off_exchange_increment_price = ProtoField.new("Off Exchange Increment Price", "ice.mdf.impact.v1.1.33.offexchangeincrementprice", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.off_exchange_increment_qty = ProtoField.new("Off Exchange Increment Qty", "ice.mdf.impact.v1.1.33.offexchangeincrementqty", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.off_exchange_increment_qty_denominator = ProtoField.new("Off Exchange Increment Qty Denominator", "ice.mdf.impact.v1.1.33.offexchangeincrementqtydenominator", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.off_market_trade_type = ProtoField.new("Off Market Trade Type", "ice.mdf.impact.v1.1.33.offmarkettradetype", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.old_off_market_trade_type = ProtoField.new("Old Off Market Trade Type", "ice.mdf.impact.v1.1.33.oldoffmarkettradetype", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.old_strip_id = ProtoField.new("Old Strip ID", "ice.mdf.impact.v1.1.33.oldstripid", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.old_style_options_trade_and_market_stats_message = ProtoField.new("Old Style Options Trade and Market Stats Message", "ice.mdf.impact.v1.1.33.oldstyleoptionstradeandmarketstatsmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.open_interest = ProtoField.new("Open Interest", "ice.mdf.impact.v1.1.33.openinterest", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.open_interest_change = ProtoField.new("Open Interest Change", "ice.mdf.impact.v1.1.33.openinterestchange", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.open_interest_date = ProtoField.new("Open Interest Date", "ice.mdf.impact.v1.1.33.openinterestdate", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.open_interest_message = ProtoField.new("Open Interest Message", "ice.mdf.impact.v1.1.33.openinterestmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.open_price = ProtoField.new("Open Price", "ice.mdf.impact.v1.1.33.openprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.open_price_message = ProtoField.new("Open Price Message", "ice.mdf.impact.v1.1.33.openpricemessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.opening_price = ProtoField.new("Opening Price", "ice.mdf.impact.v1.1.33.openingprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.option_open_interest_message = ProtoField.new("Option Open Interest Message", "ice.mdf.impact.v1.1.33.optionopeninterestmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.option_settlement_price_message = ProtoField.new("Option Settlement Price Message", "ice.mdf.impact.v1.1.33.optionsettlementpricemessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.option_type = ProtoField.new("Option Type", "ice.mdf.impact.v1.1.33.optiontype", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.options_expiration_day = ProtoField.new("Options Expiration Day", "ice.mdf.impact.v1.1.33.optionsexpirationday", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.options_expiration_month = ProtoField.new("Options Expiration Month", "ice.mdf.impact.v1.1.33.optionsexpirationmonth", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.options_expiration_type = ProtoField.new("Options Expiration Type", "ice.mdf.impact.v1.1.33.optionsexpirationtype", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.options_expiration_year = ProtoField.new("Options Expiration Year", "ice.mdf.impact.v1.1.33.optionsexpirationyear", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.options_style = ProtoField.new("Options Style", "ice.mdf.impact.v1.1.33.optionsstyle", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.order_count = ProtoField.new("Order Count", "ice.mdf.impact.v1.1.33.ordercount", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.order_entry_date_time = ProtoField.new("Order Entry Date Time", "ice.mdf.impact.v1.1.33.orderentrydatetime", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.order_id = ProtoField.new("Order ID", "ice.mdf.impact.v1.1.33.orderid", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.order_price_denominator = ProtoField.new("Order Price Denominator", "ice.mdf.impact.v1.1.33.orderpricedenominator", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.order_sequence_id = ProtoField.new("Order Sequence ID", "ice.mdf.impact.v1.1.33.ordersequenceid", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.packet = ProtoField.new("Packet", "ice.mdf.impact.v1.1.33.packet", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.packet_header = ProtoField.new("Packet Header", "ice.mdf.impact.v1.1.33.packetheader", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.payload = ProtoField.new("Payload", "ice.mdf.impact.v1.1.33.payload", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.pre_open_price = ProtoField.new("Pre Open Price", "ice.mdf.impact.v1.1.33.preopenprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.pre_open_price_indicator_message = ProtoField.new("Pre Open Price Indicator Message", "ice.mdf.impact.v1.1.33.preopenpriceindicatormessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.pre_open_volume = ProtoField.new("Pre Open Volume", "ice.mdf.impact.v1.1.33.preopenvolume", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.previous_day_settlement_price = ProtoField.new("Previous Day Settlement Price", "ice.mdf.impact.v1.1.33.previousdaysettlementprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.price = ProtoField.new("Price", "ice.mdf.impact.v1.1.33.price", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.price_in_gram = ProtoField.new("Price In Gram", "ice.mdf.impact.v1.1.33.priceingram", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.price_level_position = ProtoField.new("Price Level Position", "ice.mdf.impact.v1.1.33.pricelevelposition", ftypes.INT8, {[1]="Yes",[0]="No"})
ice_mdf_impact_v1_1_33.fields.product_id = ProtoField.new("Product ID", "ice.mdf.impact.v1.1.33.productid", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.product_name = ProtoField.new("Product Name", "ice.mdf.impact.v1.1.33.productname", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.published_date_time = ProtoField.new("Published Date Time", "ice.mdf.impact.v1.1.33.publisheddatetime", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.quantity = ProtoField.new("Quantity", "ice.mdf.impact.v1.1.33.quantity", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.reserved_bytes4 = ProtoField.new("Reserved Bytes4", "ice.mdf.impact.v1.1.33.reservedbytes4", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.reserved2_bytes = ProtoField.new("Reserved2 Bytes", "ice.mdf.impact.v1.1.33.reserved2bytes", ftypes.BYTES)
ice_mdf_impact_v1_1_33.fields.rfq_message = ProtoField.new("RFQ Message", "ice.mdf.impact.v1.1.33.rfqmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.rfq_system_id = ProtoField.new("RFQ System ID", "ice.mdf.impact.v1.1.33.rfqsystemid", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.round = ProtoField.new("Round", "ice.mdf.impact.v1.1.33.round", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.screen_last_trade_day = ProtoField.new("Screen Last Trade Day", "ice.mdf.impact.v1.1.33.screenlasttradeday", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.screen_last_trade_month = ProtoField.new("Screen Last Trade Month", "ice.mdf.impact.v1.1.33.screenlasttrademonth", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.screen_last_trade_year = ProtoField.new("Screen Last Trade Year", "ice.mdf.impact.v1.1.33.screenlasttradeyear", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.security_sub_type = ProtoField.new("Security Sub Type", "ice.mdf.impact.v1.1.33.securitysubtype", ftypes.INT16)
ice_mdf_impact_v1_1_33.fields.sequence = ProtoField.new("Sequence", "ice.mdf.impact.v1.1.33.sequence", ftypes.UINT32)
ice_mdf_impact_v1_1_33.fields.sequence_within_millis = ProtoField.new("Sequence Within Millis", "ice.mdf.impact.v1.1.33.sequencewithinmillis", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.session = ProtoField.new("Session", "ice.mdf.impact.v1.1.33.session", ftypes.UINT16)
ice_mdf_impact_v1_1_33.fields.settle_price_date_time = ProtoField.new("Settle Price Date Time", "ice.mdf.impact.v1.1.33.settlepricedatetime", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.settle_price_denominator = ProtoField.new("Settle Price Denominator", "ice.mdf.impact.v1.1.33.settlepricedenominator", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.settlement_price = ProtoField.new("Settlement Price", "ice.mdf.impact.v1.1.33.settlementprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.settlement_price_message = ProtoField.new("Settlement Price Message", "ice.mdf.impact.v1.1.33.settlementpricemessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.settlement_price_with_deal_price_precision = ProtoField.new("Settlement Price With Deal Price Precision", "ice.mdf.impact.v1.1.33.settlementpricewithdealpriceprecision", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.settlement_type = ProtoField.new("Settlement Type", "ice.mdf.impact.v1.1.33.settlementtype", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.short_name = ProtoField.new("Short Name", "ice.mdf.impact.v1.1.33.shortname", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.side = ProtoField.new("Side", "ice.mdf.impact.v1.1.33.side", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.special_field = ProtoField.new("Special Field", "ice.mdf.impact.v1.1.33.specialfield", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.special_field_id = ProtoField.new("Special Field Id", "ice.mdf.impact.v1.1.33.specialfieldid", ftypes.UINT8)
ice_mdf_impact_v1_1_33.fields.special_field_length = ProtoField.new("Special Field Length", "ice.mdf.impact.v1.1.33.specialfieldlength", ftypes.UINT16)
ice_mdf_impact_v1_1_33.fields.special_field_message = ProtoField.new("Special Field Message", "ice.mdf.impact.v1.1.33.specialfieldmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.special_field_value = ProtoField.new("Special Field Value", "ice.mdf.impact.v1.1.33.specialfieldvalue", ftypes.BYTES)
ice_mdf_impact_v1_1_33.fields.spot_market_trade_message = ProtoField.new("Spot Market Trade Message", "ice.mdf.impact.v1.1.33.spotmarkettrademessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.start_or_end = ProtoField.new("Start Or End", "ice.mdf.impact.v1.1.33.startorend", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.status = ProtoField.new("Status", "ice.mdf.impact.v1.1.33.status", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.strategy_leg_definition = ProtoField.new("Strategy Leg Definition", "ice.mdf.impact.v1.1.33.strategylegdefinition", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.strategy_symbol = ProtoField.new("Strategy Symbol", "ice.mdf.impact.v1.1.33.strategysymbol", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.strike_price = ProtoField.new("Strike Price", "ice.mdf.impact.v1.1.33.strikeprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.strip_id = ProtoField.new("Strip ID", "ice.mdf.impact.v1.1.33.stripid", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.strip_info = ProtoField.new("Strip Info", "ice.mdf.impact.v1.1.33.stripinfo", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.strip_info_message = ProtoField.new("Strip Info Message", "ice.mdf.impact.v1.1.33.stripinfomessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.strip_name = ProtoField.new("Strip Name", "ice.mdf.impact.v1.1.33.stripname", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.strip_type = ProtoField.new("Strip Type", "ice.mdf.impact.v1.1.33.striptype", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.system_priced_leg_type = ProtoField.new("System Priced Leg Type", "ice.mdf.impact.v1.1.33.systempricedlegtype", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.system_text_message = ProtoField.new("System Text Message", "ice.mdf.impact.v1.1.33.systemtextmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.test_market_indicator = ProtoField.new("Test Market Indicator", "ice.mdf.impact.v1.1.33.testmarketindicator", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.text_message = ProtoField.new("Text Message", "ice.mdf.impact.v1.1.33.textmessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.text_message_extra_fld = ProtoField.new("Text Message Extra Fld", "ice.mdf.impact.v1.1.33.textmessageextrafld", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.threshold__imbalance__qty = ProtoField.new("Threshold  Imbalance  Qty", "ice.mdf.impact.v1.1.33.thresholdimbalanceqty", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.tick_value = ProtoField.new("Tick Value", "ice.mdf.impact.v1.1.33.tickvalue", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.time = ProtoField.new("Time", "ice.mdf.impact.v1.1.33.time", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.timestamp = ProtoField.new("Timestamp", "ice.mdf.impact.v1.1.33.timestamp", ftypes.UINT64)
ice_mdf_impact_v1_1_33.fields.trade_id = ProtoField.new("Trade ID", "ice.mdf.impact.v1.1.33.tradeid", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.trade_message = ProtoField.new("Trade Message", "ice.mdf.impact.v1.1.33.trademessage", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.trading_status = ProtoField.new("Trading Status", "ice.mdf.impact.v1.1.33.tradingstatus", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.transact_date_time = ProtoField.new("Transact Date Time", "ice.mdf.impact.v1.1.33.transactdatetime", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.underlying_isin = ProtoField.new("Underlying ISIN", "ice.mdf.impact.v1.1.33.underlyingisin", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.underlying_market_id = ProtoField.new("Underlying Market ID", "ice.mdf.impact.v1.1.33.underlyingmarketid", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.unit_of_measure = ProtoField.new("Unit Of Measure", "ice.mdf.impact.v1.1.33.unitofmeasure", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.unit_qty_denominator = ProtoField.new("Unit Qty Denominator", "ice.mdf.impact.v1.1.33.unitqtydenominator", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.unit_quantity = ProtoField.new("Unit Quantity", "ice.mdf.impact.v1.1.33.unitquantity", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.usd__price = ProtoField.new("USD  Price", "ice.mdf.impact.v1.1.33.usdprice", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.valuation_date = ProtoField.new("Valuation Date", "ice.mdf.impact.v1.1.33.valuationdate", ftypes.STRING)
ice_mdf_impact_v1_1_33.fields.valuation_date_time = ProtoField.new("Valuation Date Time", "ice.mdf.impact.v1.1.33.valuationdatetime", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.volatility = ProtoField.new("Volatility", "ice.mdf.impact.v1.1.33.volatility", ftypes.INT64)
ice_mdf_impact_v1_1_33.fields.volume = ProtoField.new("Volume", "ice.mdf.impact.v1.1.33.volume", ftypes.INT32)
ice_mdf_impact_v1_1_33.fields.vwap = ProtoField.new("VWAP", "ice.mdf.impact.v1.1.33.vwap", ftypes.INT64)

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Ice Mdf iMpact 1.1.33 Element Dissection Options
show.add_or_modify_order_message = true
show.add_price_level_message = true
show.cancelled_trade_message = true
show.change_price_level_message = true
show.close_price_message = true
show.delete_order_message = true
show.delete_price_level_message = true
show.end_of_day_market_summary_message = true
show.fixing_indicative_price_message__message = true
show.fixing_lockdown_message = true
show.fixing_transition_message = true
show.hedge_definition = true
show.index_prices_message = true
show.interval_price_limit_notification_message = true
show.investigated_trade_message = true
show.leg_definition = true
show.market_event_message = true
show.market_snapshot_message = true
show.market_snapshot_order_message = true
show.market_snapshot_price_level_message = true
show.market_state_change_message = true
show.market_statistics_message = true
show.message = true
show.message_bundle_marker = true
show.message_header = true
show.new_expiry_message = true
show.new_futures_strategy_definition_message = true
show.new_options_market_definition_message = true
show.new_options_strategy_definition_message = true
show.old_style_options_trade_and_market_stats_message = true
show.open_interest_message = true
show.open_price_message = true
show.option_open_interest_message = true
show.option_settlement_price_message = true
show.packet = true
show.packet_header = true
show.pre_open_price_indicator_message = true
show.rfq_message = true
show.settlement_price_message = true
show.special_field = true
show.special_field_message = true
show.spot_market_trade_message = true
show.strategy_leg_definition = true
show.strip_info_message = true
show.system_text_message = true
show.trade_message = true
show.payload = false

-- Register Ice Mdf iMpact 1.1.33 Show Options
ice_mdf_impact_v1_1_33.prefs.show_add_or_modify_order_message = Pref.bool("Show Add or Modify Order Message", show.add_or_modify_order_message, "Parse and add Add or Modify Order Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_add_price_level_message = Pref.bool("Show Add Price Level Message", show.add_price_level_message, "Parse and add Add Price Level Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_cancelled_trade_message = Pref.bool("Show Cancelled Trade Message", show.cancelled_trade_message, "Parse and add Cancelled Trade Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_change_price_level_message = Pref.bool("Show Change Price Level Message", show.change_price_level_message, "Parse and add Change Price Level Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_close_price_message = Pref.bool("Show Close Price Message", show.close_price_message, "Parse and add Close Price Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_delete_order_message = Pref.bool("Show Delete Order Message", show.delete_order_message, "Parse and add Delete Order Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_delete_price_level_message = Pref.bool("Show Delete Price Level Message", show.delete_price_level_message, "Parse and add Delete Price Level Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_end_of_day_market_summary_message = Pref.bool("Show End of Day Market Summary Message", show.end_of_day_market_summary_message, "Parse and add End of Day Market Summary Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_fixing_indicative_price_message__message = Pref.bool("Show Fixing Indicative Price Message  Message", show.fixing_indicative_price_message__message, "Parse and add Fixing Indicative Price Message  Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_fixing_lockdown_message = Pref.bool("Show Fixing Lockdown Message", show.fixing_lockdown_message, "Parse and add Fixing Lockdown Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_fixing_transition_message = Pref.bool("Show Fixing Transition Message", show.fixing_transition_message, "Parse and add Fixing Transition Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_hedge_definition = Pref.bool("Show Hedge Definition", show.hedge_definition, "Parse and add Hedge Definition to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_index_prices_message = Pref.bool("Show Index Prices Message", show.index_prices_message, "Parse and add Index Prices Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_interval_price_limit_notification_message = Pref.bool("Show Interval Price Limit Notification Message", show.interval_price_limit_notification_message, "Parse and add Interval Price Limit Notification Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_investigated_trade_message = Pref.bool("Show Investigated Trade Message", show.investigated_trade_message, "Parse and add Investigated Trade Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_leg_definition = Pref.bool("Show Leg Definition", show.leg_definition, "Parse and add Leg Definition to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_market_event_message = Pref.bool("Show Market Event Message", show.market_event_message, "Parse and add Market Event Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_market_snapshot_message = Pref.bool("Show Market Snapshot Message", show.market_snapshot_message, "Parse and add Market Snapshot Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_market_snapshot_order_message = Pref.bool("Show Market Snapshot Order Message", show.market_snapshot_order_message, "Parse and add Market Snapshot Order Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_market_snapshot_price_level_message = Pref.bool("Show Market Snapshot Price Level Message", show.market_snapshot_price_level_message, "Parse and add Market Snapshot Price Level Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_market_state_change_message = Pref.bool("Show Market State Change Message", show.market_state_change_message, "Parse and add Market State Change Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_market_statistics_message = Pref.bool("Show Market Statistics Message", show.market_statistics_message, "Parse and add Market Statistics Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_message = Pref.bool("Show Message", show.message, "Parse and add Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_message_bundle_marker = Pref.bool("Show Message Bundle Marker", show.message_bundle_marker, "Parse and add Message Bundle Marker to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_message_header = Pref.bool("Show Message Header", show.message_header, "Parse and add Message Header to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_new_expiry_message = Pref.bool("Show New Expiry Message", show.new_expiry_message, "Parse and add New Expiry Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_new_futures_strategy_definition_message = Pref.bool("Show New Futures Strategy Definition Message", show.new_futures_strategy_definition_message, "Parse and add New Futures Strategy Definition Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_new_options_market_definition_message = Pref.bool("Show New Options Market Definition Message", show.new_options_market_definition_message, "Parse and add New Options Market Definition Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_new_options_strategy_definition_message = Pref.bool("Show New Options Strategy Definition Message", show.new_options_strategy_definition_message, "Parse and add New Options Strategy Definition Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_old_style_options_trade_and_market_stats_message = Pref.bool("Show Old Style Options Trade and Market Stats Message", show.old_style_options_trade_and_market_stats_message, "Parse and add Old Style Options Trade and Market Stats Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_open_interest_message = Pref.bool("Show Open Interest Message", show.open_interest_message, "Parse and add Open Interest Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_open_price_message = Pref.bool("Show Open Price Message", show.open_price_message, "Parse and add Open Price Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_option_open_interest_message = Pref.bool("Show Option Open Interest Message", show.option_open_interest_message, "Parse and add Option Open Interest Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_option_settlement_price_message = Pref.bool("Show Option Settlement Price Message", show.option_settlement_price_message, "Parse and add Option Settlement Price Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_packet = Pref.bool("Show Packet", show.packet, "Parse and add Packet to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_packet_header = Pref.bool("Show Packet Header", show.packet_header, "Parse and add Packet Header to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_pre_open_price_indicator_message = Pref.bool("Show Pre Open Price Indicator Message", show.pre_open_price_indicator_message, "Parse and add Pre Open Price Indicator Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_rfq_message = Pref.bool("Show RFQ Message", show.rfq_message, "Parse and add RFQ Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_settlement_price_message = Pref.bool("Show Settlement Price Message", show.settlement_price_message, "Parse and add Settlement Price Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_special_field = Pref.bool("Show Special Field", show.special_field, "Parse and add Special Field to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_special_field_message = Pref.bool("Show Special Field Message", show.special_field_message, "Parse and add Special Field Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_spot_market_trade_message = Pref.bool("Show Spot Market Trade Message", show.spot_market_trade_message, "Parse and add Spot Market Trade Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_strategy_leg_definition = Pref.bool("Show Strategy Leg Definition", show.strategy_leg_definition, "Parse and add Strategy Leg Definition to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_strip_info_message = Pref.bool("Show Strip Info Message", show.strip_info_message, "Parse and add Strip Info Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_system_text_message = Pref.bool("Show System Text Message", show.system_text_message, "Parse and add System Text Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_trade_message = Pref.bool("Show Trade Message", show.trade_message, "Parse and add Trade Message to protocol tree")
ice_mdf_impact_v1_1_33.prefs.show_payload = Pref.bool("Show Payload", show.payload, "Parse and add Payload to protocol tree")

-- Handle changed preferences
function ice_mdf_impact_v1_1_33.prefs_changed()
  local changed = false

  -- Check if show options have changed
  if show.add_or_modify_order_message ~= ice_mdf_impact_v1_1_33.prefs.show_add_or_modify_order_message then
    show.add_or_modify_order_message = ice_mdf_impact_v1_1_33.prefs.show_add_or_modify_order_message
    changed = true
  end
  if show.add_price_level_message ~= ice_mdf_impact_v1_1_33.prefs.show_add_price_level_message then
    show.add_price_level_message = ice_mdf_impact_v1_1_33.prefs.show_add_price_level_message
    changed = true
  end
  if show.cancelled_trade_message ~= ice_mdf_impact_v1_1_33.prefs.show_cancelled_trade_message then
    show.cancelled_trade_message = ice_mdf_impact_v1_1_33.prefs.show_cancelled_trade_message
    changed = true
  end
  if show.change_price_level_message ~= ice_mdf_impact_v1_1_33.prefs.show_change_price_level_message then
    show.change_price_level_message = ice_mdf_impact_v1_1_33.prefs.show_change_price_level_message
    changed = true
  end
  if show.close_price_message ~= ice_mdf_impact_v1_1_33.prefs.show_close_price_message then
    show.close_price_message = ice_mdf_impact_v1_1_33.prefs.show_close_price_message
    changed = true
  end
  if show.delete_order_message ~= ice_mdf_impact_v1_1_33.prefs.show_delete_order_message then
    show.delete_order_message = ice_mdf_impact_v1_1_33.prefs.show_delete_order_message
    changed = true
  end
  if show.delete_price_level_message ~= ice_mdf_impact_v1_1_33.prefs.show_delete_price_level_message then
    show.delete_price_level_message = ice_mdf_impact_v1_1_33.prefs.show_delete_price_level_message
    changed = true
  end
  if show.end_of_day_market_summary_message ~= ice_mdf_impact_v1_1_33.prefs.show_end_of_day_market_summary_message then
    show.end_of_day_market_summary_message = ice_mdf_impact_v1_1_33.prefs.show_end_of_day_market_summary_message
    changed = true
  end
  if show.fixing_indicative_price_message__message ~= ice_mdf_impact_v1_1_33.prefs.show_fixing_indicative_price_message__message then
    show.fixing_indicative_price_message__message = ice_mdf_impact_v1_1_33.prefs.show_fixing_indicative_price_message__message
    changed = true
  end
  if show.fixing_lockdown_message ~= ice_mdf_impact_v1_1_33.prefs.show_fixing_lockdown_message then
    show.fixing_lockdown_message = ice_mdf_impact_v1_1_33.prefs.show_fixing_lockdown_message
    changed = true
  end
  if show.fixing_transition_message ~= ice_mdf_impact_v1_1_33.prefs.show_fixing_transition_message then
    show.fixing_transition_message = ice_mdf_impact_v1_1_33.prefs.show_fixing_transition_message
    changed = true
  end
  if show.hedge_definition ~= ice_mdf_impact_v1_1_33.prefs.show_hedge_definition then
    show.hedge_definition = ice_mdf_impact_v1_1_33.prefs.show_hedge_definition
    changed = true
  end
  if show.index_prices_message ~= ice_mdf_impact_v1_1_33.prefs.show_index_prices_message then
    show.index_prices_message = ice_mdf_impact_v1_1_33.prefs.show_index_prices_message
    changed = true
  end
  if show.interval_price_limit_notification_message ~= ice_mdf_impact_v1_1_33.prefs.show_interval_price_limit_notification_message then
    show.interval_price_limit_notification_message = ice_mdf_impact_v1_1_33.prefs.show_interval_price_limit_notification_message
    changed = true
  end
  if show.investigated_trade_message ~= ice_mdf_impact_v1_1_33.prefs.show_investigated_trade_message then
    show.investigated_trade_message = ice_mdf_impact_v1_1_33.prefs.show_investigated_trade_message
    changed = true
  end
  if show.leg_definition ~= ice_mdf_impact_v1_1_33.prefs.show_leg_definition then
    show.leg_definition = ice_mdf_impact_v1_1_33.prefs.show_leg_definition
    changed = true
  end
  if show.market_event_message ~= ice_mdf_impact_v1_1_33.prefs.show_market_event_message then
    show.market_event_message = ice_mdf_impact_v1_1_33.prefs.show_market_event_message
    changed = true
  end
  if show.market_snapshot_message ~= ice_mdf_impact_v1_1_33.prefs.show_market_snapshot_message then
    show.market_snapshot_message = ice_mdf_impact_v1_1_33.prefs.show_market_snapshot_message
    changed = true
  end
  if show.market_snapshot_order_message ~= ice_mdf_impact_v1_1_33.prefs.show_market_snapshot_order_message then
    show.market_snapshot_order_message = ice_mdf_impact_v1_1_33.prefs.show_market_snapshot_order_message
    changed = true
  end
  if show.market_snapshot_price_level_message ~= ice_mdf_impact_v1_1_33.prefs.show_market_snapshot_price_level_message then
    show.market_snapshot_price_level_message = ice_mdf_impact_v1_1_33.prefs.show_market_snapshot_price_level_message
    changed = true
  end
  if show.market_state_change_message ~= ice_mdf_impact_v1_1_33.prefs.show_market_state_change_message then
    show.market_state_change_message = ice_mdf_impact_v1_1_33.prefs.show_market_state_change_message
    changed = true
  end
  if show.market_statistics_message ~= ice_mdf_impact_v1_1_33.prefs.show_market_statistics_message then
    show.market_statistics_message = ice_mdf_impact_v1_1_33.prefs.show_market_statistics_message
    changed = true
  end
  if show.message ~= ice_mdf_impact_v1_1_33.prefs.show_message then
    show.message = ice_mdf_impact_v1_1_33.prefs.show_message
    changed = true
  end
  if show.message_bundle_marker ~= ice_mdf_impact_v1_1_33.prefs.show_message_bundle_marker then
    show.message_bundle_marker = ice_mdf_impact_v1_1_33.prefs.show_message_bundle_marker
    changed = true
  end
  if show.message_header ~= ice_mdf_impact_v1_1_33.prefs.show_message_header then
    show.message_header = ice_mdf_impact_v1_1_33.prefs.show_message_header
    changed = true
  end
  if show.new_expiry_message ~= ice_mdf_impact_v1_1_33.prefs.show_new_expiry_message then
    show.new_expiry_message = ice_mdf_impact_v1_1_33.prefs.show_new_expiry_message
    changed = true
  end
  if show.new_futures_strategy_definition_message ~= ice_mdf_impact_v1_1_33.prefs.show_new_futures_strategy_definition_message then
    show.new_futures_strategy_definition_message = ice_mdf_impact_v1_1_33.prefs.show_new_futures_strategy_definition_message
    changed = true
  end
  if show.new_options_market_definition_message ~= ice_mdf_impact_v1_1_33.prefs.show_new_options_market_definition_message then
    show.new_options_market_definition_message = ice_mdf_impact_v1_1_33.prefs.show_new_options_market_definition_message
    changed = true
  end
  if show.new_options_strategy_definition_message ~= ice_mdf_impact_v1_1_33.prefs.show_new_options_strategy_definition_message then
    show.new_options_strategy_definition_message = ice_mdf_impact_v1_1_33.prefs.show_new_options_strategy_definition_message
    changed = true
  end
  if show.old_style_options_trade_and_market_stats_message ~= ice_mdf_impact_v1_1_33.prefs.show_old_style_options_trade_and_market_stats_message then
    show.old_style_options_trade_and_market_stats_message = ice_mdf_impact_v1_1_33.prefs.show_old_style_options_trade_and_market_stats_message
    changed = true
  end
  if show.open_interest_message ~= ice_mdf_impact_v1_1_33.prefs.show_open_interest_message then
    show.open_interest_message = ice_mdf_impact_v1_1_33.prefs.show_open_interest_message
    changed = true
  end
  if show.open_price_message ~= ice_mdf_impact_v1_1_33.prefs.show_open_price_message then
    show.open_price_message = ice_mdf_impact_v1_1_33.prefs.show_open_price_message
    changed = true
  end
  if show.option_open_interest_message ~= ice_mdf_impact_v1_1_33.prefs.show_option_open_interest_message then
    show.option_open_interest_message = ice_mdf_impact_v1_1_33.prefs.show_option_open_interest_message
    changed = true
  end
  if show.option_settlement_price_message ~= ice_mdf_impact_v1_1_33.prefs.show_option_settlement_price_message then
    show.option_settlement_price_message = ice_mdf_impact_v1_1_33.prefs.show_option_settlement_price_message
    changed = true
  end
  if show.packet ~= ice_mdf_impact_v1_1_33.prefs.show_packet then
    show.packet = ice_mdf_impact_v1_1_33.prefs.show_packet
    changed = true
  end
  if show.packet_header ~= ice_mdf_impact_v1_1_33.prefs.show_packet_header then
    show.packet_header = ice_mdf_impact_v1_1_33.prefs.show_packet_header
    changed = true
  end
  if show.pre_open_price_indicator_message ~= ice_mdf_impact_v1_1_33.prefs.show_pre_open_price_indicator_message then
    show.pre_open_price_indicator_message = ice_mdf_impact_v1_1_33.prefs.show_pre_open_price_indicator_message
    changed = true
  end
  if show.rfq_message ~= ice_mdf_impact_v1_1_33.prefs.show_rfq_message then
    show.rfq_message = ice_mdf_impact_v1_1_33.prefs.show_rfq_message
    changed = true
  end
  if show.settlement_price_message ~= ice_mdf_impact_v1_1_33.prefs.show_settlement_price_message then
    show.settlement_price_message = ice_mdf_impact_v1_1_33.prefs.show_settlement_price_message
    changed = true
  end
  if show.special_field ~= ice_mdf_impact_v1_1_33.prefs.show_special_field then
    show.special_field = ice_mdf_impact_v1_1_33.prefs.show_special_field
    changed = true
  end
  if show.special_field_message ~= ice_mdf_impact_v1_1_33.prefs.show_special_field_message then
    show.special_field_message = ice_mdf_impact_v1_1_33.prefs.show_special_field_message
    changed = true
  end
  if show.spot_market_trade_message ~= ice_mdf_impact_v1_1_33.prefs.show_spot_market_trade_message then
    show.spot_market_trade_message = ice_mdf_impact_v1_1_33.prefs.show_spot_market_trade_message
    changed = true
  end
  if show.strategy_leg_definition ~= ice_mdf_impact_v1_1_33.prefs.show_strategy_leg_definition then
    show.strategy_leg_definition = ice_mdf_impact_v1_1_33.prefs.show_strategy_leg_definition
    changed = true
  end
  if show.strip_info_message ~= ice_mdf_impact_v1_1_33.prefs.show_strip_info_message then
    show.strip_info_message = ice_mdf_impact_v1_1_33.prefs.show_strip_info_message
    changed = true
  end
  if show.system_text_message ~= ice_mdf_impact_v1_1_33.prefs.show_system_text_message then
    show.system_text_message = ice_mdf_impact_v1_1_33.prefs.show_system_text_message
    changed = true
  end
  if show.trade_message ~= ice_mdf_impact_v1_1_33.prefs.show_trade_message then
    show.trade_message = ice_mdf_impact_v1_1_33.prefs.show_trade_message
    changed = true
  end
  if show.payload ~= ice_mdf_impact_v1_1_33.prefs.show_payload then
    show.payload = ice_mdf_impact_v1_1_33.prefs.show_payload
    changed = true
  end

  -- Reload on changed preference
  if changed then
    reload()
  end
end


-----------------------------------------------------------------------
-- Dissect Ice Mdf iMpact 1.1.33
-----------------------------------------------------------------------

-- Size: VWAP
size_of.vwap = 8

-- Display: VWAP
display.vwap = function(value)
  return "VWAP: "..value
end

-- Dissect: VWAP
dissect.vwap = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.vwap)
  local value = range:int64()
  local display = display.vwap(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.vwap, range, value, display)

  return offset + size_of.vwap
end

-- Size: Low
size_of.low = 8

-- Display: Low
display.low = function(value)
  return "Low: "..value
end

-- Dissect: Low
dissect.low = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.low)
  local value = range:int64()
  local display = display.low(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.low, range, value, display)

  return offset + size_of.low
end

-- Size: High
size_of.high = 8

-- Display: High
display.high = function(value)
  return "High: "..value
end

-- Dissect: High
dissect.high = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.high)
  local value = range:int64()
  local display = display.high(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.high, range, value, display)

  return offset + size_of.high
end

-- Size: EFP Volume
size_of.efp_volume = 4

-- Display: EFP Volume
display.efp_volume = function(value)
  return "EFP Volume: "..value
end

-- Dissect: EFP Volume
dissect.efp_volume = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.efp_volume)
  local value = range:int()
  local display = display.efp_volume(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.efp_volume, range, value, display)

  return offset + size_of.efp_volume
end

-- Size: EFS Volume
size_of.efs_volume = 4

-- Display: EFS Volume
display.efs_volume = function(value)
  return "EFS Volume: "..value
end

-- Dissect: EFS Volume
dissect.efs_volume = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.efs_volume)
  local value = range:int()
  local display = display.efs_volume(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.efs_volume, range, value, display)

  return offset + size_of.efs_volume
end

-- Size: Block Volume
size_of.block_volume = 4

-- Display: Block Volume
display.block_volume = function(value)
  return "Block Volume: "..value
end

-- Dissect: Block Volume
dissect.block_volume = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.block_volume)
  local value = range:int()
  local display = display.block_volume(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.block_volume, range, value, display)

  return offset + size_of.block_volume
end

-- Display: Old Style Options Trade and Market Stats Message
display.old_style_options_trade_and_market_stats_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Old Style Options Trade and Market Stats Message
dissect.old_style_options_trade_and_market_stats_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Block Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.block_volume(buffer, index, packet, parent)

  -- EFS Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.efs_volume(buffer, index, packet, parent)

  -- EFP Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.efp_volume(buffer, index, packet, parent)

  -- High: 8 Byte Signed Fixed Width Integer
  index = dissect.high(buffer, index, packet, parent)

  -- Low: 8 Byte Signed Fixed Width Integer
  index = dissect.low(buffer, index, packet, parent)

  -- VWAP: 8 Byte Signed Fixed Width Integer
  index = dissect.vwap(buffer, index, packet, parent)

  return index
end

-- Dissect: Old Style Options Trade and Market Stats Message
dissect.old_style_options_trade_and_market_stats_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.old_style_options_trade_and_market_stats_message then
    local range = buffer(offset, 36)
    local display = display.old_style_options_trade_and_market_stats_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.old_style_options_trade_and_market_stats_message, range, display)
  end

  return dissect.old_style_options_trade_and_market_stats_message_fields(buffer, offset, packet, parent)
end

-- Size: Delta
size_of.delta = 8

-- Display: Delta
display.delta = function(value)
  return "Delta: "..value
end

-- Dissect: Delta
dissect.delta = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.delta)
  local value = range:int64()
  local display = display.delta(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.delta, range, value, display)

  return offset + size_of.delta
end

-- Size: Settlement Price
size_of.settlement_price = 8

-- Display: Settlement Price
display.settlement_price = function(value)
  return "Settlement Price: "..value
end

-- Dissect: Settlement Price
dissect.settlement_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.settlement_price)
  local value = range:int64()
  local display = display.settlement_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.settlement_price, range, value, display)

  return offset + size_of.settlement_price
end

-- Size: Volatility
size_of.volatility = 8

-- Display: Volatility
display.volatility = function(value)
  return "Volatility: "..value
end

-- Dissect: Volatility
dissect.volatility = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.volatility)
  local value = range:int64()
  local display = display.volatility(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.volatility, range, value, display)

  return offset + size_of.volatility
end

-- Size: Valuation Date Time
size_of.valuation_date_time = 8

-- Display: Valuation Date Time
display.valuation_date_time = function(value)
  return "Valuation Date Time: "..value
end

-- Dissect: Valuation Date Time
dissect.valuation_date_time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.valuation_date_time)
  local value = range:int64()
  local display = display.valuation_date_time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.valuation_date_time, range, value, display)

  return offset + size_of.valuation_date_time
end

-- Size: Is Official
size_of.is_official = 1

-- Display: Is Official
display.is_official = function(value)
  if value == "Y" then
    return "Is Official: Yes (Y)"
  end
  if value == "N" then
    return "Is Official: No (N)"
  end

  return "Is Official: Unknown("..value..")"
end

-- Dissect: Is Official
dissect.is_official = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_official)
  local value = range:string()
  local display = display.is_official(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_official, range, value, display)

  return offset + size_of.is_official
end

-- Size: Date Time
size_of.date_time = 8

-- Display: Date Time
display.date_time = function(value)
  return "Date Time: "..value
end

-- Dissect: Date Time
dissect.date_time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.date_time)
  local value = range:int64()
  local display = display.date_time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.date_time, range, value, display)

  return offset + size_of.date_time
end

-- Size: Settlement Price With Deal Price Precision
size_of.settlement_price_with_deal_price_precision = 8

-- Display: Settlement Price With Deal Price Precision
display.settlement_price_with_deal_price_precision = function(value)
  return "Settlement Price With Deal Price Precision: "..value
end

-- Dissect: Settlement Price With Deal Price Precision
dissect.settlement_price_with_deal_price_precision = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.settlement_price_with_deal_price_precision)
  local value = range:int64()
  local display = display.settlement_price_with_deal_price_precision(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.settlement_price_with_deal_price_precision, range, value, display)

  return offset + size_of.settlement_price_with_deal_price_precision
end

-- Size: Market ID
size_of.market_id = 4

-- Display: Market ID
display.market_id = function(value)
  return "Market ID: "..value
end

-- Dissect: Market ID
dissect.market_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.market_id)
  local value = range:int()
  local display = display.market_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.market_id, range, value, display)

  return offset + size_of.market_id
end

-- Display: Option Settlement Price Message
display.option_settlement_price_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Option Settlement Price Message
dissect.option_settlement_price_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Settlement Price With Deal Price Precision: 8 Byte Signed Fixed Width Integer
  index = dissect.settlement_price_with_deal_price_precision(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  -- Is Official: 1 Byte Ascii String Enum with 2 values
  index = dissect.is_official(buffer, index, packet, parent)

  -- Valuation Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.valuation_date_time(buffer, index, packet, parent)

  -- Volatility: 8 Byte Signed Fixed Width Integer
  index = dissect.volatility(buffer, index, packet, parent)

  -- Settlement Price: 8 Byte Signed Fixed Width Integer
  index = dissect.settlement_price(buffer, index, packet, parent)

  -- Delta: 8 Byte Signed Fixed Width Integer
  index = dissect.delta(buffer, index, packet, parent)

  return index
end

-- Dissect: Option Settlement Price Message
dissect.option_settlement_price_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.option_settlement_price_message then
    local range = buffer(offset, 53)
    local display = display.option_settlement_price_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.option_settlement_price_message, range, display)
  end

  return dissect.option_settlement_price_message_fields(buffer, offset, packet, parent)
end

-- Size: Open Interest Date
size_of.open_interest_date = 10

-- Display: Open Interest Date
display.open_interest_date = function(value)
  return "Open Interest Date: "..value
end

-- Dissect: Open Interest Date
dissect.open_interest_date = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.open_interest_date)
  local value = range:string()
  local display = display.open_interest_date(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.open_interest_date, range, value, display)

  return offset + size_of.open_interest_date
end

-- Size: Open Interest
size_of.open_interest = 4

-- Display: Open Interest
display.open_interest = function(value)
  return "Open Interest: "..value
end

-- Dissect: Open Interest
dissect.open_interest = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.open_interest)
  local value = range:int()
  local display = display.open_interest(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.open_interest, range, value, display)

  return offset + size_of.open_interest
end

-- Display: Option Open Interest Message
display.option_open_interest_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Option Open Interest Message
dissect.option_open_interest_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Open Interest: 4 Byte Signed Fixed Width Integer
  index = dissect.open_interest(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  -- Open Interest Date: 10 Byte Ascii String
  index = dissect.open_interest_date(buffer, index, packet, parent)

  return index
end

-- Dissect: Option Open Interest Message
dissect.option_open_interest_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.option_open_interest_message then
    local range = buffer(offset, 26)
    local display = display.option_open_interest_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.option_open_interest_message, range, display)
  end

  return dissect.option_open_interest_message_fields(buffer, offset, packet, parent)
end

-- Size: Side
size_of.side = 1

-- Display: Side
display.side = function(value)
  return "Side: "..value
end

-- Dissect: Side
dissect.side = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.side)
  local value = range:string()
  local display = display.side(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.side, range, value, display)

  return offset + size_of.side
end

-- Size: Quantity
size_of.quantity = 4

-- Display: Quantity
display.quantity = function(value)
  return "Quantity: "..value
end

-- Dissect: Quantity
dissect.quantity = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.quantity)
  local value = range:int()
  local display = display.quantity(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.quantity, range, value, display)

  return offset + size_of.quantity
end

-- Size: Underlying Market ID
size_of.underlying_market_id = 4

-- Display: Underlying Market ID
display.underlying_market_id = function(value)
  return "Underlying Market ID: "..value
end

-- Dissect: Underlying Market ID
dissect.underlying_market_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.underlying_market_id)
  local value = range:int()
  local display = display.underlying_market_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.underlying_market_id, range, value, display)

  return offset + size_of.underlying_market_id
end

-- Size: Market Type ID
size_of.market_type_id = 2

-- Display: Market Type ID
display.market_type_id = function(value)
  return "Market Type ID: "..value
end

-- Dissect: Market Type ID
dissect.market_type_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.market_type_id)
  local value = range:int()
  local display = display.market_type_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.market_type_id, range, value, display)

  return offset + size_of.market_type_id
end

-- Size: RFQ System ID
size_of.rfq_system_id = 8

-- Display: RFQ System ID
display.rfq_system_id = function(value)
  return "RFQ System ID: "..value
end

-- Dissect: RFQ System ID
dissect.rfq_system_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.rfq_system_id)
  local value = range:int64()
  local display = display.rfq_system_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.rfq_system_id, range, value, display)

  return offset + size_of.rfq_system_id
end

-- Size: Message Timestamp
size_of.message_timestamp = 8

-- Display: Message Timestamp
display.message_timestamp = function(value)
  return "Message Timestamp: "..value
end

-- Dissect: Message Timestamp
dissect.message_timestamp = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.message_timestamp)
  local value = range:int64()
  local display = display.message_timestamp(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.message_timestamp, range, value, display)

  return offset + size_of.message_timestamp
end

-- Display: RFQ Message
display.rfq_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: RFQ Message
dissect.rfq_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Message Timestamp: 8 Byte Signed Fixed Width Integer
  index = dissect.message_timestamp(buffer, index, packet, parent)

  -- RFQ System ID: 8 Byte Signed Fixed Width Integer
  index = dissect.rfq_system_id(buffer, index, packet, parent)

  -- Market Type ID: 2 Byte Signed Fixed Width Integer
  index = dissect.market_type_id(buffer, index, packet, parent)

  -- Underlying Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.underlying_market_id(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String
  index = dissect.side(buffer, index, packet, parent)

  return index
end

-- Dissect: RFQ Message
dissect.rfq_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.rfq_message then
    local range = buffer(offset, 31)
    local display = display.rfq_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.rfq_message, range, display)
  end

  return dissect.rfq_message_fields(buffer, offset, packet, parent)
end

-- Size: Screen Last Trade Day
size_of.screen_last_trade_day = 2

-- Display: Screen Last Trade Day
display.screen_last_trade_day = function(value)
  return "Screen Last Trade Day: "..value
end

-- Dissect: Screen Last Trade Day
dissect.screen_last_trade_day = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.screen_last_trade_day)
  local value = range:int()
  local display = display.screen_last_trade_day(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.screen_last_trade_day, range, value, display)

  return offset + size_of.screen_last_trade_day
end

-- Size: Screen Last Trade Month
size_of.screen_last_trade_month = 2

-- Display: Screen Last Trade Month
display.screen_last_trade_month = function(value)
  return "Screen Last Trade Month: "..value
end

-- Dissect: Screen Last Trade Month
dissect.screen_last_trade_month = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.screen_last_trade_month)
  local value = range:int()
  local display = display.screen_last_trade_month(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.screen_last_trade_month, range, value, display)

  return offset + size_of.screen_last_trade_month
end

-- Size: Screen Last Trade Year
size_of.screen_last_trade_year = 2

-- Display: Screen Last Trade Year
display.screen_last_trade_year = function(value)
  return "Screen Last Trade Year: "..value
end

-- Dissect: Screen Last Trade Year
dissect.screen_last_trade_year = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.screen_last_trade_year)
  local value = range:int()
  local display = display.screen_last_trade_year(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.screen_last_trade_year, range, value, display)

  return offset + size_of.screen_last_trade_year
end

-- Size: MIFID Regulated Market
size_of.mifid_regulated_market = 1

-- Display: MIFID Regulated Market
display.mifid_regulated_market = function(value)
  if value == "Y" then
    return "MIFID Regulated Market: Yes (Y)"
  end
  if value == "N" then
    return "MIFID Regulated Market: No (N)"
  end

  return "MIFID Regulated Market: Unknown("..value..")"
end

-- Dissect: MIFID Regulated Market
dissect.mifid_regulated_market = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.mifid_regulated_market)
  local value = range:string()
  local display = display.mifid_regulated_market(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.mifid_regulated_market, range, value, display)

  return offset + size_of.mifid_regulated_market
end

-- Size: Unit Of Measure
size_of.unit_of_measure = 30

-- Display: Unit Of Measure
display.unit_of_measure = function(value)
  return "Unit Of Measure: "..value
end

-- Dissect: Unit Of Measure
dissect.unit_of_measure = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.unit_of_measure)
  local value = range:string()
  local display = display.unit_of_measure(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.unit_of_measure, range, value, display)

  return offset + size_of.unit_of_measure
end

-- Size: Guaranteed Cross Supported
size_of.guaranteed_cross_supported = 1

-- Display: Guaranteed Cross Supported
display.guaranteed_cross_supported = function(value)
  return "Guaranteed Cross Supported: "..value
end

-- Dissect: Guaranteed Cross Supported
dissect.guaranteed_cross_supported = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.guaranteed_cross_supported)
  local value = range:string()
  local display = display.guaranteed_cross_supported(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.guaranteed_cross_supported, range, value, display)

  return offset + size_of.guaranteed_cross_supported
end

-- Size: Cross Order Supported
size_of.cross_order_supported = 1

-- Display: Cross Order Supported
display.cross_order_supported = function(value)
  if value == "Y" then
    return "Cross Order Supported: Yes (Y)"
  end
  if value == "N" then
    return "Cross Order Supported: No (N)"
  end

  return "Cross Order Supported: Unknown("..value..")"
end

-- Dissect: Cross Order Supported
dissect.cross_order_supported = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.cross_order_supported)
  local value = range:string()
  local display = display.cross_order_supported(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.cross_order_supported, range, value, display)

  return offset + size_of.cross_order_supported
end

-- Size: GT Allowed
size_of.gt_allowed = 1

-- Display: GT Allowed
display.gt_allowed = function(value)
  if value == "Y" then
    return "GT Allowed: Yes (Y)"
  end
  if value == "N" then
    return "GT Allowed: No (N)"
  end

  return "GT Allowed: Unknown("..value..")"
end

-- Dissect: GT Allowed
dissect.gt_allowed = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.gt_allowed)
  local value = range:string()
  local display = display.gt_allowed(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.gt_allowed, range, value, display)

  return offset + size_of.gt_allowed
end

-- Size: Is Block Only
size_of.is_block_only = 1

-- Display: Is Block Only
display.is_block_only = function(value)
  if value == "Y" then
    return "Is Block Only: Yes (Y)"
  end
  if value == "N" then
    return "Is Block Only: No (N)"
  end

  return "Is Block Only: Unknown("..value..")"
end

-- Dissect: Is Block Only
dissect.is_block_only = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_block_only)
  local value = range:string()
  local display = display.is_block_only(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_block_only, range, value, display)

  return offset + size_of.is_block_only
end

-- Size: Settlement Type
size_of.settlement_type = 1

-- Display: Settlement Type
display.settlement_type = function(value)
  if value == "0" then
    return "Settlement Type: Financial (0)"
  end
  if value == "1" then
    return "Settlement Type: Physical (1)"
  end

  return "Settlement Type: Unknown("..value..")"
end

-- Dissect: Settlement Type
dissect.settlement_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.settlement_type)
  local value = range:string()
  local display = display.settlement_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.settlement_type, range, value, display)

  return offset + size_of.settlement_type
end

-- Size: Flex Allowed
size_of.flex_allowed = 1

-- Display: Flex Allowed
display.flex_allowed = function(value)
  return "Flex Allowed: "..value
end

-- Dissect: Flex Allowed
dissect.flex_allowed = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.flex_allowed)
  local value = range:string()
  local display = display.flex_allowed(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.flex_allowed, range, value, display)

  return offset + size_of.flex_allowed
end

-- Size: Tick Value
size_of.tick_value = 8

-- Display: Tick Value
display.tick_value = function(value)
  return "Tick Value: "..value
end

-- Dissect: Tick Value
dissect.tick_value = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.tick_value)
  local value = range:int64()
  local display = display.tick_value(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.tick_value, range, value, display)

  return offset + size_of.tick_value
end

-- Size: Unit Qty Denominator
size_of.unit_qty_denominator = 1

-- Display: Unit Qty Denominator
display.unit_qty_denominator = function(value)
  return "Unit Qty Denominator: "..value
end

-- Dissect: Unit Qty Denominator
dissect.unit_qty_denominator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.unit_qty_denominator)
  local value = range:string()
  local display = display.unit_qty_denominator(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.unit_qty_denominator, range, value, display)

  return offset + size_of.unit_qty_denominator
end

-- Size: Settle Price Denominator
size_of.settle_price_denominator = 1

-- Display: Settle Price Denominator
display.settle_price_denominator = function(value)
  return "Settle Price Denominator: "..value
end

-- Dissect: Settle Price Denominator
dissect.settle_price_denominator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.settle_price_denominator)
  local value = range:string()
  local display = display.settle_price_denominator(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.settle_price_denominator, range, value, display)

  return offset + size_of.settle_price_denominator
end

-- Size: Hedge Market ID
size_of.hedge_market_id = 4

-- Display: Hedge Market ID
display.hedge_market_id = function(value)
  return "Hedge Market ID: "..value
end

-- Dissect: Hedge Market ID
dissect.hedge_market_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hedge_market_id)
  local value = range:uint()
  local display = display.hedge_market_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hedge_market_id, range, value, display)

  return offset + size_of.hedge_market_id
end

-- Size: Options Expiration Type
size_of.options_expiration_type = 1

-- Display: Options Expiration Type
display.options_expiration_type = function(value)
  return "Options Expiration Type: "..value
end

-- Dissect: Options Expiration Type
dissect.options_expiration_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.options_expiration_type)
  local value = range:string()
  local display = display.options_expiration_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.options_expiration_type, range, value, display)

  return offset + size_of.options_expiration_type
end

-- Size: Options Style
size_of.options_style = 1

-- Display: Options Style
display.options_style = function(value)
  return "Options Style: "..value
end

-- Dissect: Options Style
dissect.options_style = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.options_style)
  local value = range:string()
  local display = display.options_style(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.options_style, range, value, display)

  return offset + size_of.options_style
end

-- Size: Options Expiration Day
size_of.options_expiration_day = 2

-- Display: Options Expiration Day
display.options_expiration_day = function(value)
  return "Options Expiration Day: "..value
end

-- Dissect: Options Expiration Day
dissect.options_expiration_day = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.options_expiration_day)
  local value = range:int()
  local display = display.options_expiration_day(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.options_expiration_day, range, value, display)

  return offset + size_of.options_expiration_day
end

-- Size: Options Expiration Month
size_of.options_expiration_month = 2

-- Display: Options Expiration Month
display.options_expiration_month = function(value)
  return "Options Expiration Month: "..value
end

-- Dissect: Options Expiration Month
dissect.options_expiration_month = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.options_expiration_month)
  local value = range:int()
  local display = display.options_expiration_month(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.options_expiration_month, range, value, display)

  return offset + size_of.options_expiration_month
end

-- Size: Options Expiration Year
size_of.options_expiration_year = 2

-- Display: Options Expiration Year
display.options_expiration_year = function(value)
  return "Options Expiration Year: "..value
end

-- Dissect: Options Expiration Year
dissect.options_expiration_year = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.options_expiration_year)
  local value = range:int()
  local display = display.options_expiration_year(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.options_expiration_year, range, value, display)

  return offset + size_of.options_expiration_year
end

-- Size: Increment Premium Price
size_of.increment_premium_price = 4

-- Display: Increment Premium Price
display.increment_premium_price = function(value)
  return "Increment Premium Price: "..value
end

-- Dissect: Increment Premium Price
dissect.increment_premium_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.increment_premium_price)
  local value = range:int()
  local display = display.increment_premium_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.increment_premium_price, range, value, display)

  return offset + size_of.increment_premium_price
end

-- Size: Max Options Price
size_of.max_options_price = 8

-- Display: Max Options Price
display.max_options_price = function(value)
  return "Max Options Price: "..value
end

-- Dissect: Max Options Price
dissect.max_options_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.max_options_price)
  local value = range:int64()
  local display = display.max_options_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.max_options_price, range, value, display)

  return offset + size_of.max_options_price
end

-- Size: Min Options Price
size_of.min_options_price = 8

-- Display: Min Options Price
display.min_options_price = function(value)
  return "Min Options Price: "..value
end

-- Dissect: Min Options Price
dissect.min_options_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.min_options_price)
  local value = range:int64()
  local display = display.min_options_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.min_options_price, range, value, display)

  return offset + size_of.min_options_price
end

-- Size: Num Decimals Strike Price
size_of.num_decimals_strike_price = 1

-- Display: Num Decimals Strike Price
display.num_decimals_strike_price = function(value)
  return "Num Decimals Strike Price: "..value
end

-- Dissect: Num Decimals Strike Price
dissect.num_decimals_strike_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.num_decimals_strike_price)
  local value = range:string()
  local display = display.num_decimals_strike_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.num_decimals_strike_price, range, value, display)

  return offset + size_of.num_decimals_strike_price
end

-- Size: Currency
size_of.currency = 20

-- Display: Currency
display.currency = function(value)
  return "Currency: "..value
end

-- Dissect: Currency
dissect.currency = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.currency)
  local value = range:string()
  local display = display.currency(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.currency, range, value, display)

  return offset + size_of.currency
end

-- Size: Min Qty
size_of.min_qty = 4

-- Display: Min Qty
display.min_qty = function(value)
  return "Min Qty: "..value
end

-- Dissect: Min Qty
dissect.min_qty = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.min_qty)
  local value = range:int()
  local display = display.min_qty(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.min_qty, range, value, display)

  return offset + size_of.min_qty
end

-- Size: Deal Price Denominator
size_of.deal_price_denominator = 1

-- Display: Deal Price Denominator
display.deal_price_denominator = function(value)
  return "Deal Price Denominator: "..value
end

-- Dissect: Deal Price Denominator
dissect.deal_price_denominator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.deal_price_denominator)
  local value = range:string()
  local display = display.deal_price_denominator(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.deal_price_denominator, range, value, display)

  return offset + size_of.deal_price_denominator
end

-- Size: Strike Price
size_of.strike_price = 8

-- Display: Strike Price
display.strike_price = function(value)
  return "Strike Price: "..value
end

-- Dissect: Strike Price
dissect.strike_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.strike_price)
  local value = range:int64()
  local display = display.strike_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.strike_price, range, value, display)

  return offset + size_of.strike_price
end

-- Size: Option Type
size_of.option_type = 1

-- Display: Option Type
display.option_type = function(value)
  return "Option Type: "..value
end

-- Dissect: Option Type
dissect.option_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.option_type)
  local value = range:string()
  local display = display.option_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.option_type, range, value, display)

  return offset + size_of.option_type
end

-- Size: Market Desc
size_of.market_desc = 120

-- Display: Market Desc
display.market_desc = function(value)
  return "Market Desc: "..value
end

-- Dissect: Market Desc
dissect.market_desc = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.market_desc)
  local value = range:string()
  local display = display.market_desc(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.market_desc, range, value, display)

  return offset + size_of.market_desc
end

-- Size: Lot Size
size_of.lot_size = 4

-- Display: Lot Size
display.lot_size = function(value)
  return "Lot Size: "..value
end

-- Dissect: Lot Size
dissect.lot_size = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.lot_size)
  local value = range:int()
  local display = display.lot_size(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.lot_size, range, value, display)

  return offset + size_of.lot_size
end

-- Size: Increment Qty
size_of.increment_qty = 4

-- Display: Increment Qty
display.increment_qty = function(value)
  return "Increment Qty: "..value
end

-- Dissect: Increment Qty
dissect.increment_qty = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.increment_qty)
  local value = range:int()
  local display = display.increment_qty(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.increment_qty, range, value, display)

  return offset + size_of.increment_qty
end

-- Size: Order Price Denominator
size_of.order_price_denominator = 1

-- Display: Order Price Denominator
display.order_price_denominator = function(value)
  return "Order Price Denominator: "..value
end

-- Dissect: Order Price Denominator
dissect.order_price_denominator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.order_price_denominator)
  local value = range:string()
  local display = display.order_price_denominator(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.order_price_denominator, range, value, display)

  return offset + size_of.order_price_denominator
end

-- Size: Trading Status
size_of.trading_status = 1

-- Display: Trading Status
display.trading_status = function(value)
  if value == "O" then
    return "Trading Status: Open (O)"
  end
  if value == "C" then
    return "Trading Status: Close (C)"
  end
  if value == "E" then
    return "Trading Status: Expired (E)"
  end
  if value == "1" then
    return "Trading Status: Pre Open (1)"
  end
  if value == "2" then
    return "Trading Status: Pre Close (2)"
  end

  return "Trading Status: Unknown("..value..")"
end

-- Dissect: Trading Status
dissect.trading_status = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.trading_status)
  local value = range:string()
  local display = display.trading_status(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.trading_status, range, value, display)

  return offset + size_of.trading_status
end

-- Size: Futures Contract Symbol
size_of.futures_contract_symbol = 70

-- Display: Futures Contract Symbol
display.futures_contract_symbol = function(value)
  return "Futures Contract Symbol: "..value
end

-- Dissect: Futures Contract Symbol
dissect.futures_contract_symbol = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.futures_contract_symbol)
  local value = range:string()
  local display = display.futures_contract_symbol(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.futures_contract_symbol, range, value, display)

  return offset + size_of.futures_contract_symbol
end

-- Display: New Options Market Definition Message
display.new_options_market_definition_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: New Options Market Definition Message
dissect.new_options_market_definition_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Underlying Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.underlying_market_id(buffer, index, packet, parent)

  -- Futures Contract Symbol: 70 Byte Ascii String
  index = dissect.futures_contract_symbol(buffer, index, packet, parent)

  -- Trading Status: 1 Byte Ascii String Enum with 5 values
  index = dissect.trading_status(buffer, index, packet, parent)

  -- Order Price Denominator: 1 Byte Ascii String
  index = dissect.order_price_denominator(buffer, index, packet, parent)

  -- Increment Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.increment_qty(buffer, index, packet, parent)

  -- Lot Size: 4 Byte Signed Fixed Width Integer
  index = dissect.lot_size(buffer, index, packet, parent)

  -- Market Desc: 120 Byte Ascii String
  index = dissect.market_desc(buffer, index, packet, parent)

  -- Option Type: 1 Byte Ascii String
  index = dissect.option_type(buffer, index, packet, parent)

  -- Strike Price: 8 Byte Signed Fixed Width Integer
  index = dissect.strike_price(buffer, index, packet, parent)

  -- Deal Price Denominator: 1 Byte Ascii String
  index = dissect.deal_price_denominator(buffer, index, packet, parent)

  -- Min Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.min_qty(buffer, index, packet, parent)

  -- Currency: 20 Byte Ascii String
  index = dissect.currency(buffer, index, packet, parent)

  -- Num Decimals Strike Price: 1 Byte Ascii String
  index = dissect.num_decimals_strike_price(buffer, index, packet, parent)

  -- Min Options Price: 8 Byte Signed Fixed Width Integer
  index = dissect.min_options_price(buffer, index, packet, parent)

  -- Max Options Price: 8 Byte Signed Fixed Width Integer
  index = dissect.max_options_price(buffer, index, packet, parent)

  -- Increment Premium Price: 4 Byte Signed Fixed Width Integer
  index = dissect.increment_premium_price(buffer, index, packet, parent)

  -- Options Expiration Year: 2 Byte Signed Fixed Width Integer
  index = dissect.options_expiration_year(buffer, index, packet, parent)

  -- Options Expiration Month: 2 Byte Signed Fixed Width Integer
  index = dissect.options_expiration_month(buffer, index, packet, parent)

  -- Options Expiration Day: 2 Byte Signed Fixed Width Integer
  index = dissect.options_expiration_day(buffer, index, packet, parent)

  -- Options Style: 1 Byte Ascii String
  index = dissect.options_style(buffer, index, packet, parent)

  -- Options Expiration Type: 1 Byte Ascii String
  index = dissect.options_expiration_type(buffer, index, packet, parent)

  -- Hedge Market ID: 4 Byte Unsigned Fixed Width Integer
  index = dissect.hedge_market_id(buffer, index, packet, parent)

  -- Settle Price Denominator: 1 Byte Ascii String
  index = dissect.settle_price_denominator(buffer, index, packet, parent)

  -- Unit Qty Denominator: 1 Byte Ascii String
  index = dissect.unit_qty_denominator(buffer, index, packet, parent)

  -- Tick Value: 8 Byte Signed Fixed Width Integer
  index = dissect.tick_value(buffer, index, packet, parent)

  -- Flex Allowed: 1 Byte Ascii String
  index = dissect.flex_allowed(buffer, index, packet, parent)

  -- Settlement Type: 1 Byte Ascii String Enum with 2 values
  index = dissect.settlement_type(buffer, index, packet, parent)

  -- Is Block Only: 1 Byte Ascii String Enum with 2 values
  index = dissect.is_block_only(buffer, index, packet, parent)

  -- GT Allowed: 1 Byte Ascii String Enum with 2 values
  index = dissect.gt_allowed(buffer, index, packet, parent)

  -- Cross Order Supported: 1 Byte Ascii String Enum with 2 values
  index = dissect.cross_order_supported(buffer, index, packet, parent)

  -- Guaranteed Cross Supported: 1 Byte Ascii String
  index = dissect.guaranteed_cross_supported(buffer, index, packet, parent)

  -- Unit Of Measure: 30 Byte Ascii String
  index = dissect.unit_of_measure(buffer, index, packet, parent)

  -- MIFID Regulated Market: 1 Byte Ascii String Enum with 2 values
  index = dissect.mifid_regulated_market(buffer, index, packet, parent)

  -- Screen Last Trade Year: 2 Byte Signed Fixed Width Integer
  index = dissect.screen_last_trade_year(buffer, index, packet, parent)

  -- Screen Last Trade Month: 2 Byte Signed Fixed Width Integer
  index = dissect.screen_last_trade_month(buffer, index, packet, parent)

  -- Screen Last Trade Day: 2 Byte Signed Fixed Width Integer
  index = dissect.screen_last_trade_day(buffer, index, packet, parent)

  return index
end

-- Dissect: New Options Market Definition Message
dissect.new_options_market_definition_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.new_options_market_definition_message then
    local range = buffer(offset, 328)
    local display = display.new_options_market_definition_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.new_options_market_definition_message, range, display)
  end

  return dissect.new_options_market_definition_message_fields(buffer, offset, packet, parent)
end

-- Size: Leg Deal Suppressed
size_of.leg_deal_suppressed = 1

-- Display: Leg Deal Suppressed
display.leg_deal_suppressed = function(value)
  if value == "Y" then
    return "Leg Deal Suppressed: Yes (Y)"
  end
  if value == "N" then
    return "Leg Deal Suppressed: No (N)"
  end

  return "Leg Deal Suppressed: Unknown("..value..")"
end

-- Dissect: Leg Deal Suppressed
dissect.leg_deal_suppressed = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_deal_suppressed)
  local value = range:string()
  local display = display.leg_deal_suppressed(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.leg_deal_suppressed, range, value, display)

  return offset + size_of.leg_deal_suppressed
end

-- Size: Contract Symbol Extra
size_of.contract_symbol_extra = 35

-- Display: Contract Symbol Extra
display.contract_symbol_extra = function(value)
  return "Contract Symbol Extra: "..value
end

-- Dissect: Contract Symbol Extra
dissect.contract_symbol_extra = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.contract_symbol_extra)
  local value = range:string()
  local display = display.contract_symbol_extra(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.contract_symbol_extra, range, value, display)

  return offset + size_of.contract_symbol_extra
end

-- Size: Test Market Indicator
size_of.test_market_indicator = 1

-- Display: Test Market Indicator
display.test_market_indicator = function(value)
  return "Test Market Indicator: "..value
end

-- Dissect: Test Market Indicator
dissect.test_market_indicator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.test_market_indicator)
  local value = range:string()
  local display = display.test_market_indicator(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.test_market_indicator, range, value, display)

  return offset + size_of.test_market_indicator
end

-- Size: Strategy Symbol
size_of.strategy_symbol = 18

-- Display: Strategy Symbol
display.strategy_symbol = function(value)
  return "Strategy Symbol: "..value
end

-- Dissect: Strategy Symbol
dissect.strategy_symbol = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.strategy_symbol)
  local value = range:string()
  local display = display.strategy_symbol(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.strategy_symbol, range, value, display)

  return offset + size_of.strategy_symbol
end

-- Size: Security Sub Type
size_of.security_sub_type = 2

-- Display: Security Sub Type
display.security_sub_type = function(value)
  return "Security Sub Type: "..value
end

-- Dissect: Security Sub Type
dissect.security_sub_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.security_sub_type)
  local value = range:int()
  local display = display.security_sub_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.security_sub_type, range, value, display)

  return offset + size_of.security_sub_type
end

-- Size: Hedge Strategy Code
size_of.hedge_strategy_code = 2

-- Display: Hedge Strategy Code
display.hedge_strategy_code = function(value)
  return "Hedge Strategy Code: "..value
end

-- Dissect: Hedge Strategy Code
dissect.hedge_strategy_code = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hedge_strategy_code)
  local value = range:uint()
  local display = display.hedge_strategy_code(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hedge_strategy_code, range, value, display)

  return offset + size_of.hedge_strategy_code
end

-- Size: Hedge Delta
size_of.hedge_delta = 2

-- Display: Hedge Delta
display.hedge_delta = function(value)
  return "Hedge Delta: "..value
end

-- Dissect: Hedge Delta
dissect.hedge_delta = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hedge_delta)
  local value = range:uint()
  local display = display.hedge_delta(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hedge_delta, range, value, display)

  return offset + size_of.hedge_delta
end

-- Size: Hedge Price Denominator
size_of.hedge_price_denominator = 1

-- Display: Hedge Price Denominator
display.hedge_price_denominator = function(value)
  return "Hedge Price Denominator: "..value
end

-- Dissect: Hedge Price Denominator
dissect.hedge_price_denominator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hedge_price_denominator)
  local value = range:string()
  local display = display.hedge_price_denominator(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hedge_price_denominator, range, value, display)

  return offset + size_of.hedge_price_denominator
end

-- Size: Hedge Price
size_of.hedge_price = 8

-- Display: Hedge Price
display.hedge_price = function(value)
  return "Hedge Price: "..value
end

-- Dissect: Hedge Price
dissect.hedge_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hedge_price)
  local value = range:uint64()
  local display = display.hedge_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hedge_price, range, value, display)

  return offset + size_of.hedge_price
end

-- Size: Hedge Side
size_of.hedge_side = 1

-- Display: Hedge Side
display.hedge_side = function(value)
  return "Hedge Side: "..value
end

-- Dissect: Hedge Side
dissect.hedge_side = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hedge_side)
  local value = range:string()
  local display = display.hedge_side(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hedge_side, range, value, display)

  return offset + size_of.hedge_side
end

-- Size: Hedge Security Type
size_of.hedge_security_type = 1

-- Display: Hedge Security Type
display.hedge_security_type = function(value)
  return "Hedge Security Type: "..value
end

-- Dissect: Hedge Security Type
dissect.hedge_security_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hedge_security_type)
  local value = range:string()
  local display = display.hedge_security_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hedge_security_type, range, value, display)

  return offset + size_of.hedge_security_type
end

-- Size: Hedge Market Id
size_of.hedge_market_id = 4

-- Display: Hedge Market Id
display.hedge_market_id = function(value)
  return "Hedge Market Id: "..value
end

-- Dissect: Hedge Market Id
dissect.hedge_market_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hedge_market_id)
  local value = range:uint()
  local display = display.hedge_market_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hedge_market_id, range, value, display)

  return offset + size_of.hedge_market_id
end

-- Size: Hedge Body Length
size_of.hedge_body_length = 1

-- Display: Hedge Body Length
display.hedge_body_length = function(value)
  return "Hedge Body Length: "..value
end

-- Dissect: Hedge Body Length
dissect.hedge_body_length = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hedge_body_length)
  local value = range:uint()
  local display = display.hedge_body_length(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hedge_body_length, range, value, display)

  return offset + size_of.hedge_body_length
end

-- Display: Hedge Definition
display.hedge_definition = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Hedge Definition
dissect.hedge_definition_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Hedge Body Length: 1 Byte Unsigned Fixed Width Integer
  index = dissect.hedge_body_length(buffer, index, packet, parent)

  -- Hedge Market Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.hedge_market_id(buffer, index, packet, parent)

  -- Hedge Security Type: 1 Byte Ascii String
  index = dissect.hedge_security_type(buffer, index, packet, parent)

  -- Hedge Side: 1 Byte Ascii String
  index = dissect.hedge_side(buffer, index, packet, parent)

  -- Hedge Price: 8 Byte Unsigned Fixed Width Integer
  index = dissect.hedge_price(buffer, index, packet, parent)

  -- Hedge Price Denominator: 1 Byte Ascii String
  index = dissect.hedge_price_denominator(buffer, index, packet, parent)

  -- Hedge Delta: 2 Byte Unsigned Fixed Width Integer
  index = dissect.hedge_delta(buffer, index, packet, parent)

  -- Hedge Strategy Code: 2 Byte Unsigned Fixed Width Integer
  index = dissect.hedge_strategy_code(buffer, index, packet, parent)

  return index
end

-- Dissect: Hedge Definition
dissect.hedge_definition = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.hedge_definition then
    local range = buffer(offset, 20)
    local display = display.hedge_definition(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.hedge_definition, range, display)
  end

  return dissect.hedge_definition_fields(buffer, offset, packet, parent)
end

-- Size: Number Of Hedge Definitions
size_of.number_of_hedge_definitions = 1

-- Display: Number Of Hedge Definitions
display.number_of_hedge_definitions = function(value)
  return "Number Of Hedge Definitions: "..value
end

-- Dissect: Number Of Hedge Definitions
dissect.number_of_hedge_definitions = function(buffer, offset, packet, parent)
  local length = 1
  local range = buffer(offset, length)
  local value = range:int()
  local display = display.number_of_hedge_definitions(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.number_of_hedge_definitions, range, value, display)

  return offset + length, value
end

-- Size: Leg Ratio Price Denominator
size_of.leg_ratio_price_denominator = 4

-- Display: Leg Ratio Price Denominator
display.leg_ratio_price_denominator = function(value)
  return "Leg Ratio Price Denominator: "..value
end

-- Dissect: Leg Ratio Price Denominator
dissect.leg_ratio_price_denominator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_ratio_price_denominator)
  local value = range:uint()
  local display = display.leg_ratio_price_denominator(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.leg_ratio_price_denominator, range, value, display)

  return offset + size_of.leg_ratio_price_denominator
end

-- Size: Leg Ratio Price Numerator
size_of.leg_ratio_price_numerator = 4

-- Display: Leg Ratio Price Numerator
display.leg_ratio_price_numerator = function(value)
  return "Leg Ratio Price Numerator: "..value
end

-- Dissect: Leg Ratio Price Numerator
dissect.leg_ratio_price_numerator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_ratio_price_numerator)
  local value = range:uint()
  local display = display.leg_ratio_price_numerator(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.leg_ratio_price_numerator, range, value, display)

  return offset + size_of.leg_ratio_price_numerator
end

-- Size: Leg Ratio Qty Denominator
size_of.leg_ratio_qty_denominator = 4

-- Display: Leg Ratio Qty Denominator
display.leg_ratio_qty_denominator = function(value)
  return "Leg Ratio Qty Denominator: "..value
end

-- Dissect: Leg Ratio Qty Denominator
dissect.leg_ratio_qty_denominator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_ratio_qty_denominator)
  local value = range:uint()
  local display = display.leg_ratio_qty_denominator(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.leg_ratio_qty_denominator, range, value, display)

  return offset + size_of.leg_ratio_qty_denominator
end

-- Size: Leg Ratio Qty Numerator
size_of.leg_ratio_qty_numerator = 4

-- Display: Leg Ratio Qty Numerator
display.leg_ratio_qty_numerator = function(value)
  return "Leg Ratio Qty Numerator: "..value
end

-- Dissect: Leg Ratio Qty Numerator
dissect.leg_ratio_qty_numerator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_ratio_qty_numerator)
  local value = range:uint()
  local display = display.leg_ratio_qty_numerator(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.leg_ratio_qty_numerator, range, value, display)

  return offset + size_of.leg_ratio_qty_numerator
end

-- Size: Leg Strategy Code
size_of.leg_strategy_code = 2

-- Display: Leg Strategy Code
display.leg_strategy_code = function(value)
  return "Leg Strategy Code: "..value
end

-- Dissect: Leg Strategy Code
dissect.leg_strategy_code = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_strategy_code)
  local value = range:uint()
  local display = display.leg_strategy_code(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.leg_strategy_code, range, value, display)

  return offset + size_of.leg_strategy_code
end

-- Size: Leg Side
size_of.leg_side = 1

-- Display: Leg Side
display.leg_side = function(value)
  return "Leg Side: "..value
end

-- Dissect: Leg Side
dissect.leg_side = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_side)
  local value = range:string()
  local display = display.leg_side(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.leg_side, range, value, display)

  return offset + size_of.leg_side
end

-- Size: Leg Ratio
size_of.leg_ratio = 2

-- Display: Leg Ratio
display.leg_ratio = function(value)
  return "Leg Ratio: "..value
end

-- Dissect: Leg Ratio
dissect.leg_ratio = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_ratio)
  local value = range:uint()
  local display = display.leg_ratio(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.leg_ratio, range, value, display)

  return offset + size_of.leg_ratio
end

-- Size: Leg Underlying Market Id
size_of.leg_underlying_market_id = 4

-- Display: Leg Underlying Market Id
display.leg_underlying_market_id = function(value)
  return "Leg Underlying Market Id: "..value
end

-- Dissect: Leg Underlying Market Id
dissect.leg_underlying_market_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_underlying_market_id)
  local value = range:uint()
  local display = display.leg_underlying_market_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.leg_underlying_market_id, range, value, display)

  return offset + size_of.leg_underlying_market_id
end

-- Size: Leg Market Id
size_of.leg_market_id = 4

-- Display: Leg Market Id
display.leg_market_id = function(value)
  return "Leg Market Id: "..value
end

-- Dissect: Leg Market Id
dissect.leg_market_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_market_id)
  local value = range:uint()
  local display = display.leg_market_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.leg_market_id, range, value, display)

  return offset + size_of.leg_market_id
end

-- Size: Leg Body Length
size_of.leg_body_length = 1

-- Display: Leg Body Length
display.leg_body_length = function(value)
  return "Leg Body Length: "..value
end

-- Dissect: Leg Body Length
dissect.leg_body_length = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_body_length)
  local value = range:uint()
  local display = display.leg_body_length(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.leg_body_length, range, value, display)

  return offset + size_of.leg_body_length
end

-- Display: Strategy Leg Definition
display.strategy_leg_definition = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Strategy Leg Definition
dissect.strategy_leg_definition_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Leg Body Length: 1 Byte Unsigned Fixed Width Integer
  index = dissect.leg_body_length(buffer, index, packet, parent)

  -- Leg Market Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_market_id(buffer, index, packet, parent)

  -- Leg Underlying Market Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_underlying_market_id(buffer, index, packet, parent)

  -- Leg Ratio: 2 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio(buffer, index, packet, parent)

  -- Leg Side: 1 Byte Ascii String
  index = dissect.leg_side(buffer, index, packet, parent)

  -- Leg Strategy Code: 2 Byte Unsigned Fixed Width Integer
  index = dissect.leg_strategy_code(buffer, index, packet, parent)

  -- Leg Ratio Qty Numerator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio_qty_numerator(buffer, index, packet, parent)

  -- Leg Ratio Qty Denominator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio_qty_denominator(buffer, index, packet, parent)

  -- Leg Ratio Price Numerator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio_price_numerator(buffer, index, packet, parent)

  -- Leg Ratio Price Denominator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio_price_denominator(buffer, index, packet, parent)

  return index
end

-- Dissect: Strategy Leg Definition
dissect.strategy_leg_definition = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.strategy_leg_definition then
    local range = buffer(offset, 30)
    local display = display.strategy_leg_definition(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.strategy_leg_definition, range, display)
  end

  return dissect.strategy_leg_definition_fields(buffer, offset, packet, parent)
end

-- Size: Number Of Strategy Leg Definitions
size_of.number_of_strategy_leg_definitions = 1

-- Display: Number Of Strategy Leg Definitions
display.number_of_strategy_leg_definitions = function(value)
  return "Number Of Strategy Leg Definitions: "..value
end

-- Dissect: Number Of Strategy Leg Definitions
dissect.number_of_strategy_leg_definitions = function(buffer, offset, packet, parent)
  local length = 1
  local range = buffer(offset, length)
  local value = range:int()
  local display = display.number_of_strategy_leg_definitions(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.number_of_strategy_leg_definitions, range, value, display)

  return offset + length, value
end

-- Size: Increment Price
size_of.increment_price = 4

-- Display: Increment Price
display.increment_price = function(value)
  return "Increment Price: "..value
end

-- Dissect: Increment Price
dissect.increment_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.increment_price)
  local value = range:int()
  local display = display.increment_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.increment_price, range, value, display)

  return offset + size_of.increment_price
end

-- Size: Contract Symbol
size_of.contract_symbol = 35

-- Display: Contract Symbol
display.contract_symbol = function(value)
  return "Contract Symbol: "..value
end

-- Dissect: Contract Symbol
dissect.contract_symbol = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.contract_symbol)
  local value = range:string()
  local display = display.contract_symbol(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.contract_symbol, range, value, display)

  return offset + size_of.contract_symbol
end

-- Calculate runtime size: New Options Strategy Definition Message
size_of.new_options_strategy_definition_message = function(buffer, offset)
  local index = 0

  index = index + 58

  -- Calculate field size from count
  local strategy_leg_definition_count = buffer(offset + index - 1, 1):int()
  index = index + strategy_leg_definition_count * 30

  index = index + 1

  -- Calculate field size from count
  local hedge_definition_count = buffer(offset + index - 1, 1):int()
  index = index + hedge_definition_count * 20

  return index
end

-- Display: New Options Strategy Definition Message
display.new_options_strategy_definition_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: New Options Strategy Definition Message
dissect.new_options_strategy_definition_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Underlying Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.underlying_market_id(buffer, index, packet, parent)

  -- Contract Symbol: 35 Byte Ascii String
  index = dissect.contract_symbol(buffer, index, packet, parent)

  -- Trading Status: 1 Byte Ascii String Enum with 5 values
  index = dissect.trading_status(buffer, index, packet, parent)

  -- Order Price Denominator: 1 Byte Ascii String
  index = dissect.order_price_denominator(buffer, index, packet, parent)

  -- Increment Price: 4 Byte Signed Fixed Width Integer
  index = dissect.increment_price(buffer, index, packet, parent)

  -- Increment Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.increment_qty(buffer, index, packet, parent)

  -- Min Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.min_qty(buffer, index, packet, parent)

  -- Number Of Strategy Leg Definitions: 1 Byte Signed Fixed Width Integer
  index = dissect.number_of_strategy_leg_definitions(buffer, index, packet, parent)

  -- Strategy Leg Definition: Struct of 10 fields
  local strategy_leg_definition_count = buffer(index - 1, 1):int()
  for i = 1, strategy_leg_definition_count do
    index = dissect.strategy_leg_definition(buffer, index, packet, parent)
  end

  -- Number Of Hedge Definitions: 1 Byte Signed Fixed Width Integer
  index = dissect.number_of_hedge_definitions(buffer, index, packet, parent)

  -- Hedge Definition: Struct of 8 fields
  local hedge_definition_count = buffer(index - 1, 1):int()
  for i = 1, hedge_definition_count do
    index = dissect.hedge_definition(buffer, index, packet, parent)
  end

  -- Security Sub Type: 2 Byte Signed Fixed Width Integer
  index = dissect.security_sub_type(buffer, index, packet, parent)

  -- Is Block Only: 1 Byte Ascii String Enum with 2 values
  index = dissect.is_block_only(buffer, index, packet, parent)

  -- Strategy Symbol: 18 Byte Ascii String
  index = dissect.strategy_symbol(buffer, index, packet, parent)

  -- GT Allowed: 1 Byte Ascii String Enum with 2 values
  index = dissect.gt_allowed(buffer, index, packet, parent)

  -- MIFID Regulated Market: 1 Byte Ascii String Enum with 2 values
  index = dissect.mifid_regulated_market(buffer, index, packet, parent)

  -- Deal Price Denominator: 1 Byte Ascii String
  index = dissect.deal_price_denominator(buffer, index, packet, parent)

  -- Settle Price Denominator: 1 Byte Ascii String
  index = dissect.settle_price_denominator(buffer, index, packet, parent)

  -- Unit Qty Denominator: 1 Byte Ascii String
  index = dissect.unit_qty_denominator(buffer, index, packet, parent)

  -- Test Market Indicator: 1 Byte Ascii String
  index = dissect.test_market_indicator(buffer, index, packet, parent)

  -- Contract Symbol Extra: 35 Byte Ascii String
  index = dissect.contract_symbol_extra(buffer, index, packet, parent)

  -- Leg Deal Suppressed: 1 Byte Ascii String Enum with 2 values
  index = dissect.leg_deal_suppressed(buffer, index, packet, parent)

  return index
end

-- Dissect: New Options Strategy Definition Message
dissect.new_options_strategy_definition_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.new_options_strategy_definition_message then
    local length = size_of.new_options_strategy_definition_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.new_options_strategy_definition_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.new_options_strategy_definition_message, range, display)
  end

  return dissect.new_options_strategy_definition_message_fields(buffer, offset, packet, parent)
end

-- Size: Timestamp
size_of.timestamp = 8

-- Display: Timestamp
display.timestamp = function(value)
  return "Timestamp: "..value
end

-- Dissect: Timestamp
dissect.timestamp = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.timestamp)
  local value = range:uint64()
  local display = display.timestamp(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.timestamp, range, value, display)

  return offset + size_of.timestamp
end

-- Size: Price Level Position
size_of.price_level_position = 1

-- Display: Price Level Position
display.price_level_position = function(value)
  return "Price Level Position: "..value
end

-- Dissect: Price Level Position
dissect.price_level_position = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.price_level_position)
  local value = range:int()
  local display = display.price_level_position(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.price_level_position, range, value, display)

  return offset + size_of.price_level_position
end

-- Display: Delete Price Level Message
display.delete_price_level_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Delete Price Level Message
dissect.delete_price_level_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String
  index = dissect.side(buffer, index, packet, parent)

  -- Price Level Position: 1 Byte Signed Fixed Width Integer
  index = dissect.price_level_position(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  return index
end

-- Dissect: Delete Price Level Message
dissect.delete_price_level_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.delete_price_level_message then
    local range = buffer(offset, 14)
    local display = display.delete_price_level_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.delete_price_level_message, range, display)
  end

  return dissect.delete_price_level_message_fields(buffer, offset, packet, parent)
end

-- Size: Implied Order Count
size_of.implied_order_count = 2

-- Display: Implied Order Count
display.implied_order_count = function(value)
  return "Implied Order Count: "..value
end

-- Dissect: Implied Order Count
dissect.implied_order_count = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.implied_order_count)
  local value = range:int()
  local display = display.implied_order_count(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.implied_order_count, range, value, display)

  return offset + size_of.implied_order_count
end

-- Size: Implied Quantity
size_of.implied_quantity = 4

-- Display: Implied Quantity
display.implied_quantity = function(value)
  return "Implied Quantity: "..value
end

-- Dissect: Implied Quantity
dissect.implied_quantity = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.implied_quantity)
  local value = range:int()
  local display = display.implied_quantity(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.implied_quantity, range, value, display)

  return offset + size_of.implied_quantity
end

-- Size: Order Count
size_of.order_count = 2

-- Display: Order Count
display.order_count = function(value)
  return "Order Count: "..value
end

-- Dissect: Order Count
dissect.order_count = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.order_count)
  local value = range:int()
  local display = display.order_count(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.order_count, range, value, display)

  return offset + size_of.order_count
end

-- Size: Price
size_of.price = 8

-- Display: Price
display.price = function(value)
  return "Price: "..value
end

-- Dissect: Price
dissect.price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.price)
  local value = range:int64()
  local display = display.price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.price, range, value, display)

  return offset + size_of.price
end

-- Display: Change Price Level Message
display.change_price_level_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Change Price Level Message
dissect.change_price_level_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String
  index = dissect.side(buffer, index, packet, parent)

  -- Price Level Position: 1 Byte Signed Fixed Width Integer
  index = dissect.price_level_position(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Order Count: 2 Byte Signed Fixed Width Integer
  index = dissect.order_count(buffer, index, packet, parent)

  -- Implied Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.implied_quantity(buffer, index, packet, parent)

  -- Implied Order Count: 2 Byte Signed Fixed Width Integer
  index = dissect.implied_order_count(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  return index
end

-- Dissect: Change Price Level Message
dissect.change_price_level_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.change_price_level_message then
    local range = buffer(offset, 34)
    local display = display.change_price_level_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.change_price_level_message, range, display)
  end

  return dissect.change_price_level_message_fields(buffer, offset, packet, parent)
end

-- Display: Add Price Level Message
display.add_price_level_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Add Price Level Message
dissect.add_price_level_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String
  index = dissect.side(buffer, index, packet, parent)

  -- Price Level Position: 1 Byte Signed Fixed Width Integer
  index = dissect.price_level_position(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Order Count: 2 Byte Signed Fixed Width Integer
  index = dissect.order_count(buffer, index, packet, parent)

  -- Implied Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.implied_quantity(buffer, index, packet, parent)

  -- Implied Order Count: 2 Byte Signed Fixed Width Integer
  index = dissect.implied_order_count(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  return index
end

-- Dissect: Add Price Level Message
dissect.add_price_level_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.add_price_level_message then
    local range = buffer(offset, 34)
    local display = display.add_price_level_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.add_price_level_message, range, display)
  end

  return dissect.add_price_level_message_fields(buffer, offset, packet, parent)
end

-- Display: Market Snapshot Price Level Message
display.market_snapshot_price_level_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Market Snapshot Price Level Message
dissect.market_snapshot_price_level_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String
  index = dissect.side(buffer, index, packet, parent)

  -- Price Level Position: 1 Byte Signed Fixed Width Integer
  index = dissect.price_level_position(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Order Count: 2 Byte Signed Fixed Width Integer
  index = dissect.order_count(buffer, index, packet, parent)

  -- Implied Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.implied_quantity(buffer, index, packet, parent)

  -- Implied Order Count: 2 Byte Signed Fixed Width Integer
  index = dissect.implied_order_count(buffer, index, packet, parent)

  return index
end

-- Dissect: Market Snapshot Price Level Message
dissect.market_snapshot_price_level_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.market_snapshot_price_level_message then
    local range = buffer(offset, 26)
    local display = display.market_snapshot_price_level_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.market_snapshot_price_level_message, range, display)
  end

  return dissect.market_snapshot_price_level_message_fields(buffer, offset, packet, parent)
end

-- Size: Num Decimals Price In Gram
size_of.num_decimals_price_in_gram = 1

-- Display: Num Decimals Price In Gram
display.num_decimals_price_in_gram = function(value)
  return "Num Decimals Price In Gram: "..value
end

-- Dissect: Num Decimals Price In Gram
dissect.num_decimals_price_in_gram = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.num_decimals_price_in_gram)
  local value = range:int()
  local display = display.num_decimals_price_in_gram(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.num_decimals_price_in_gram, range, value, display)

  return offset + size_of.num_decimals_price_in_gram
end

-- Size: Num Decimals Price
size_of.num_decimals_price = 1

-- Display: Num Decimals Price
display.num_decimals_price = function(value)
  return "Num Decimals Price: "..value
end

-- Dissect: Num Decimals Price
dissect.num_decimals_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.num_decimals_price)
  local value = range:int()
  local display = display.num_decimals_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.num_decimals_price, range, value, display)

  return offset + size_of.num_decimals_price
end

-- Size: Price In Gram
size_of.price_in_gram = 8

-- Display: Price In Gram
display.price_in_gram = function(value)
  return "Price In Gram: "..value
end

-- Dissect: Price In Gram
dissect.price_in_gram = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.price_in_gram)
  local value = range:int64()
  local display = display.price_in_gram(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.price_in_gram, range, value, display)

  return offset + size_of.price_in_gram
end

-- Size: Iba Currency
size_of.iba_currency = 3

-- Display: Iba Currency
display.iba_currency = function(value)
  return "Iba Currency: "..value
end

-- Dissect: Iba Currency
dissect.iba_currency = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.iba_currency)
  local value = range:string()
  local display = display.iba_currency(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.iba_currency, range, value, display)

  return offset + size_of.iba_currency
end

-- Display: Fixing Indicative Price Message  Message
display.fixing_indicative_price_message__message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Fixing Indicative Price Message  Message
dissect.fixing_indicative_price_message__message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Iba Currency: 3 Byte Ascii String
  index = dissect.iba_currency(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Price In Gram: 8 Byte Signed Fixed Width Integer
  index = dissect.price_in_gram(buffer, index, packet, parent)

  -- Num Decimals Price: 1 Byte Signed Fixed Width Integer
  index = dissect.num_decimals_price(buffer, index, packet, parent)

  -- Num Decimals Price In Gram: 1 Byte Signed Fixed Width Integer
  index = dissect.num_decimals_price_in_gram(buffer, index, packet, parent)

  return index
end

-- Dissect: Fixing Indicative Price Message  Message
dissect.fixing_indicative_price_message__message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.fixing_indicative_price_message__message then
    local range = buffer(offset, 25)
    local display = display.fixing_indicative_price_message__message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.fixing_indicative_price_message__message, range, display)
  end

  return dissect.fixing_indicative_price_message__message_fields(buffer, offset, packet, parent)
end

-- Size: EUR  Price
size_of.eur__price = 8

-- Display: EUR  Price
display.eur__price = function(value)
  return "EUR  Price: "..value
end

-- Dissect: EUR  Price
dissect.eur__price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.eur__price)
  local value = range:int64()
  local display = display.eur__price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.eur__price, range, value, display)

  return offset + size_of.eur__price
end

-- Size: GBP  Price
size_of.gbp__price = 8

-- Display: GBP  Price
display.gbp__price = function(value)
  return "GBP  Price: "..value
end

-- Dissect: GBP  Price
dissect.gbp__price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.gbp__price)
  local value = range:int64()
  local display = display.gbp__price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.gbp__price, range, value, display)

  return offset + size_of.gbp__price
end

-- Size: Is Final
size_of.is_final = 1

-- Display: Is Final
display.is_final = function(value)
  return "Is Final: "..value
end

-- Dissect: Is Final
dissect.is_final = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_final)
  local value = range:string()
  local display = display.is_final(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_final, range, value, display)

  return offset + size_of.is_final
end

-- Size: Is Balanced
size_of.is_balanced = 1

-- Display: Is Balanced
display.is_balanced = function(value)
  return "Is Balanced: "..value
end

-- Dissect: Is Balanced
dissect.is_balanced = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_balanced)
  local value = range:string()
  local display = display.is_balanced(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_balanced, range, value, display)

  return offset + size_of.is_balanced
end

-- Size: USD  Price
size_of.usd__price = 8

-- Display: USD  Price
display.usd__price = function(value)
  return "USD  Price: "..value
end

-- Dissect: USD  Price
dissect.usd__price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.usd__price)
  local value = range:int64()
  local display = display.usd__price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.usd__price, range, value, display)

  return offset + size_of.usd__price
end

-- Size: Agg  Offer  Qty
size_of.agg__offer__qty = 4

-- Display: Agg  Offer  Qty
display.agg__offer__qty = function(value)
  return "Agg  Offer  Qty: "..value
end

-- Dissect: Agg  Offer  Qty
dissect.agg__offer__qty = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.agg__offer__qty)
  local value = range:int()
  local display = display.agg__offer__qty(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.agg__offer__qty, range, value, display)

  return offset + size_of.agg__offer__qty
end

-- Size: Agg  Bid  Qty
size_of.agg__bid__qty = 4

-- Display: Agg  Bid  Qty
display.agg__bid__qty = function(value)
  return "Agg  Bid  Qty: "..value
end

-- Dissect: Agg  Bid  Qty
dissect.agg__bid__qty = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.agg__bid__qty)
  local value = range:int()
  local display = display.agg__bid__qty(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.agg__bid__qty, range, value, display)

  return offset + size_of.agg__bid__qty
end

-- Size: Round
size_of.round = 2

-- Display: Round
display.round = function(value)
  return "Round: "..value
end

-- Dissect: Round
dissect.round = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.round)
  local value = range:int()
  local display = display.round(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.round, range, value, display)

  return offset + size_of.round
end

-- Size: Description
size_of.description = 20

-- Display: Description
display.description = function(value)
  return "Description: "..value
end

-- Dissect: Description
dissect.description = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.description)
  local value = range:string()
  local display = display.description(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.description, range, value, display)

  return offset + size_of.description
end

-- Size: Time
size_of.time = 8

-- Display: Time
display.time = function(value)
  return "Time: "..value
end

-- Dissect: Time
dissect.time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.time)
  local value = range:int64()
  local display = display.time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.time, range, value, display)

  return offset + size_of.time
end

-- Size: Auction  Date
size_of.auction__date = 10

-- Display: Auction  Date
display.auction__date = function(value)
  return "Auction  Date: "..value
end

-- Dissect: Auction  Date
dissect.auction__date = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.auction__date)
  local value = range:string()
  local display = display.auction__date(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.auction__date, range, value, display)

  return offset + size_of.auction__date
end

-- Display: Fixing Lockdown Message
display.fixing_lockdown_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Fixing Lockdown Message
dissect.fixing_lockdown_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Auction  Date: 10 Byte Ascii String
  index = dissect.auction__date(buffer, index, packet, parent)

  -- Time: 8 Byte Signed Fixed Width Integer
  index = dissect.time(buffer, index, packet, parent)

  -- Description: 20 Byte Ascii String
  index = dissect.description(buffer, index, packet, parent)

  -- Round: 2 Byte Signed Fixed Width Integer
  index = dissect.round(buffer, index, packet, parent)

  -- Agg  Bid  Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.agg__bid__qty(buffer, index, packet, parent)

  -- Agg  Offer  Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.agg__offer__qty(buffer, index, packet, parent)

  -- USD  Price: 8 Byte Signed Fixed Width Integer
  index = dissect.usd__price(buffer, index, packet, parent)

  -- Is Balanced: 1 Byte Ascii String
  index = dissect.is_balanced(buffer, index, packet, parent)

  -- Is Final: 1 Byte Ascii String
  index = dissect.is_final(buffer, index, packet, parent)

  -- GBP  Price: 8 Byte Signed Fixed Width Integer
  index = dissect.gbp__price(buffer, index, packet, parent)

  -- EUR  Price: 8 Byte Signed Fixed Width Integer
  index = dissect.eur__price(buffer, index, packet, parent)

  return index
end

-- Dissect: Fixing Lockdown Message
dissect.fixing_lockdown_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.fixing_lockdown_message then
    local range = buffer(offset, 78)
    local display = display.fixing_lockdown_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.fixing_lockdown_message, range, display)
  end

  return dissect.fixing_lockdown_message_fields(buffer, offset, packet, parent)
end

-- Size: Threshold  Imbalance  Qty
size_of.threshold__imbalance__qty = 4

-- Display: Threshold  Imbalance  Qty
display.threshold__imbalance__qty = function(value)
  return "Threshold  Imbalance  Qty: "..value
end

-- Dissect: Threshold  Imbalance  Qty
dissect.threshold__imbalance__qty = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.threshold__imbalance__qty)
  local value = range:int()
  local display = display.threshold__imbalance__qty(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.threshold__imbalance__qty, range, value, display)

  return offset + size_of.threshold__imbalance__qty
end

-- Size: Auction End Time
size_of.auction_end_time = 8

-- Display: Auction End Time
display.auction_end_time = function(value)
  return "Auction End Time: "..value
end

-- Dissect: Auction End Time
dissect.auction_end_time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.auction_end_time)
  local value = range:int64()
  local display = display.auction_end_time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.auction_end_time, range, value, display)

  return offset + size_of.auction_end_time
end

-- Size: Status
size_of.status = 1

-- Display: Status
display.status = function(value)
  return "Status: "..value
end

-- Dissect: Status
dissect.status = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.status)
  local value = range:string()
  local display = display.status(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.status, range, value, display)

  return offset + size_of.status
end

-- Display: Fixing Transition Message
display.fixing_transition_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Fixing Transition Message
dissect.fixing_transition_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Status: 1 Byte Ascii String
  index = dissect.status(buffer, index, packet, parent)

  -- Auction End Time: 8 Byte Signed Fixed Width Integer
  index = dissect.auction_end_time(buffer, index, packet, parent)

  -- Threshold  Imbalance  Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.threshold__imbalance__qty(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  return index
end

-- Dissect: Fixing Transition Message
dissect.fixing_transition_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.fixing_transition_message then
    local range = buffer(offset, 25)
    local display = display.fixing_transition_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.fixing_transition_message, range, display)
  end

  return dissect.fixing_transition_message_fields(buffer, offset, packet, parent)
end

-- Size: Start Or End
size_of.start_or_end = 1

-- Display: Start Or End
display.start_or_end = function(value)
  return "Start Or End: "..value
end

-- Dissect: Start Or End
dissect.start_or_end = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.start_or_end)
  local value = range:string()
  local display = display.start_or_end(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.start_or_end, range, value, display)

  return offset + size_of.start_or_end
end

-- Display: Message Bundle Marker
display.message_bundle_marker = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message Bundle Marker
dissect.message_bundle_marker_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Start Or End: 1 Byte Ascii String
  index = dissect.start_or_end(buffer, index, packet, parent)

  return index
end

-- Dissect: Message Bundle Marker
dissect.message_bundle_marker = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.message_bundle_marker then
    local range = buffer(offset, 1)
    local display = display.message_bundle_marker(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.message_bundle_marker, range, display)
  end

  return dissect.message_bundle_marker_fields(buffer, offset, packet, parent)
end

-- Size: Sequence Within Millis
size_of.sequence_within_millis = 4

-- Display: Sequence Within Millis
display.sequence_within_millis = function(value)
  return "Sequence Within Millis: "..value
end

-- Dissect: Sequence Within Millis
dissect.sequence_within_millis = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.sequence_within_millis)
  local value = range:int()
  local display = display.sequence_within_millis(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.sequence_within_millis, range, value, display)

  return offset + size_of.sequence_within_millis
end

-- Size: Order ID
size_of.order_id = 8

-- Display: Order ID
display.order_id = function(value)
  return "Order ID: "..value
end

-- Dissect: Order ID
dissect.order_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.order_id)
  local value = range:int64()
  local display = display.order_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.order_id, range, value, display)

  return offset + size_of.order_id
end

-- Display: Delete Order Message
display.delete_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Delete Order Message
dissect.delete_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Order ID: 8 Byte Signed Fixed Width Integer
  index = dissect.order_id(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  -- Sequence Within Millis: 4 Byte Signed Fixed Width Integer
  index = dissect.sequence_within_millis(buffer, index, packet, parent)

  return index
end

-- Dissect: Delete Order Message
dissect.delete_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.delete_order_message then
    local range = buffer(offset, 24)
    local display = display.delete_order_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.delete_order_message, range, display)
  end

  return dissect.delete_order_message_fields(buffer, offset, packet, parent)
end

-- Size: Modification Timestamp
size_of.modification_timestamp = 8

-- Display: Modification Timestamp
display.modification_timestamp = function(value)
  return "Modification Timestamp: "..value
end

-- Dissect: Modification Timestamp
dissect.modification_timestamp = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.modification_timestamp)
  local value = range:int64()
  local display = display.modification_timestamp(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.modification_timestamp, range, value, display)

  return offset + size_of.modification_timestamp
end

-- Size: Extra Flags
size_of.extra_flags = 1

-- Display: Extra Flags
display.extra_flags = function(value)
  return "Extra Flags: "..value
end

-- Dissect: Extra Flags
dissect.extra_flags = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.extra_flags)
  local value = range:int()
  local display = display.extra_flags(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.extra_flags, range, value, display)

  return offset + size_of.extra_flags
end

-- Size: Order Entry Date Time
size_of.order_entry_date_time = 8

-- Display: Order Entry Date Time
display.order_entry_date_time = function(value)
  return "Order Entry Date Time: "..value
end

-- Dissect: Order Entry Date Time
dissect.order_entry_date_time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.order_entry_date_time)
  local value = range:int64()
  local display = display.order_entry_date_time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.order_entry_date_time, range, value, display)

  return offset + size_of.order_entry_date_time
end

-- Size: Is RFQ
size_of.is_rfq = 1

-- Display: Is RFQ
display.is_rfq = function(value)
  return "Is RFQ: "..value
end

-- Dissect: Is RFQ
dissect.is_rfq = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_rfq)
  local value = range:string()
  local display = display.is_rfq(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_rfq, range, value, display)

  return offset + size_of.is_rfq
end

-- Size: Is Implied
size_of.is_implied = 1

-- Display: Is Implied
display.is_implied = function(value)
  return "Is Implied: "..value
end

-- Dissect: Is Implied
dissect.is_implied = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_implied)
  local value = range:string()
  local display = display.is_implied(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_implied, range, value, display)

  return offset + size_of.is_implied
end

-- Size: Order Sequence ID
size_of.order_sequence_id = 2

-- Display: Order Sequence ID
display.order_sequence_id = function(value)
  return "Order Sequence ID: "..value
end

-- Dissect: Order Sequence ID
dissect.order_sequence_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.order_sequence_id)
  local value = range:int()
  local display = display.order_sequence_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.order_sequence_id, range, value, display)

  return offset + size_of.order_sequence_id
end

-- Display: Add or Modify Order Message
display.add_or_modify_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Add or Modify Order Message
dissect.add_or_modify_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Order ID: 8 Byte Signed Fixed Width Integer
  index = dissect.order_id(buffer, index, packet, parent)

  -- Order Sequence ID: 2 Byte Signed Fixed Width Integer
  index = dissect.order_sequence_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String
  index = dissect.side(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Is Implied: 1 Byte Ascii String
  index = dissect.is_implied(buffer, index, packet, parent)

  -- Is RFQ: 1 Byte Ascii String
  index = dissect.is_rfq(buffer, index, packet, parent)

  -- Order Entry Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.order_entry_date_time(buffer, index, packet, parent)

  -- Extra Flags: 1 Byte Signed Fixed Width Integer
  index = dissect.extra_flags(buffer, index, packet, parent)

  -- Sequence Within Millis: 4 Byte Signed Fixed Width Integer
  index = dissect.sequence_within_millis(buffer, index, packet, parent)

  -- Modification Timestamp: 8 Byte Signed Fixed Width Integer
  index = dissect.modification_timestamp(buffer, index, packet, parent)

  return index
end

-- Dissect: Add or Modify Order Message
dissect.add_or_modify_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.add_or_modify_order_message then
    local range = buffer(offset, 50)
    local display = display.add_or_modify_order_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.add_or_modify_order_message, range, display)
  end

  return dissect.add_or_modify_order_message_fields(buffer, offset, packet, parent)
end

-- Display: Market Snapshot Order Message
display.market_snapshot_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Market Snapshot Order Message
dissect.market_snapshot_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Order ID: 8 Byte Signed Fixed Width Integer
  index = dissect.order_id(buffer, index, packet, parent)

  -- Order Sequence ID: 2 Byte Signed Fixed Width Integer
  index = dissect.order_sequence_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String
  index = dissect.side(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Is Implied: 1 Byte Ascii String
  index = dissect.is_implied(buffer, index, packet, parent)

  -- Is RFQ: 1 Byte Ascii String
  index = dissect.is_rfq(buffer, index, packet, parent)

  -- Order Entry Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.order_entry_date_time(buffer, index, packet, parent)

  -- Sequence Within Millis: 4 Byte Signed Fixed Width Integer
  index = dissect.sequence_within_millis(buffer, index, packet, parent)

  return index
end

-- Dissect: Market Snapshot Order Message
dissect.market_snapshot_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.market_snapshot_order_message then
    local range = buffer(offset, 41)
    local display = display.market_snapshot_order_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.market_snapshot_order_message, range, display)
  end

  return dissect.market_snapshot_order_message_fields(buffer, offset, packet, parent)
end

-- Size: Special Field Value
size_of.special_field_value = 0

-- Display: Special Field Value
display.special_field_value = function(value)
  return "Special Field Value: "..value
end

-- Dissect: Special Field Value
dissect.special_field_value = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.special_field_value)
  local value = range:bytes():tohex(false, " ")
  local display = display.special_field_value(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.special_field_value, range, value, display)

  return offset + size_of.special_field_value
end

-- Size: Special Field Length
size_of.special_field_length = 2

-- Display: Special Field Length
display.special_field_length = function(value)
  return "Special Field Length: "..value
end

-- Dissect: Special Field Length
dissect.special_field_length = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.special_field_length)
  local value = range:uint()
  local display = display.special_field_length(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.special_field_length, range, value, display)

  return offset + size_of.special_field_length
end

-- Size: Special Field Id
size_of.special_field_id = 1

-- Display: Special Field Id
display.special_field_id = function(value)
  return "Special Field Id: "..value
end

-- Dissect: Special Field Id
dissect.special_field_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.special_field_id)
  local value = range:uint()
  local display = display.special_field_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.special_field_id, range, value, display)

  return offset + size_of.special_field_id
end

-- Display: Special Field
display.special_field = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Special Field
dissect.special_field_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Special Field Id: 1 Byte Unsigned Fixed Width Integer
  index = dissect.special_field_id(buffer, index, packet, parent)

  -- Special Field Length: 2 Byte Unsigned Fixed Width Integer
  index = dissect.special_field_length(buffer, index, packet, parent)

  -- Special Field Value: 0 Byte
  index = dissect.special_field_value(buffer, index, packet, parent)

  return index
end

-- Dissect: Special Field
dissect.special_field = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.special_field then
    local range = buffer(offset, 3)
    local display = display.special_field(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.special_field, range, display)
  end

  return dissect.special_field_fields(buffer, offset, packet, parent)
end

-- Size: Number Of Special Fields
size_of.number_of_special_fields = 1

-- Display: Number Of Special Fields
display.number_of_special_fields = function(value)
  return "Number Of Special Fields: "..value
end

-- Dissect: Number Of Special Fields
dissect.number_of_special_fields = function(buffer, offset, packet, parent)
  local length = 1
  local range = buffer(offset, length)
  local value = range:int()
  local display = display.number_of_special_fields(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.number_of_special_fields, range, value, display)

  return offset + length, value
end

-- Calculate runtime size: Special Field Message
size_of.special_field_message = function(buffer, offset)
  local index = 0

  index = index + 1

  -- Calculate field size from count
  local special_field_count = buffer(offset + index - 1, 1):int()
  index = index + special_field_count * 3

  return index
end

-- Display: Special Field Message
display.special_field_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Special Field Message
dissect.special_field_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Number Of Special Fields: 1 Byte Signed Fixed Width Integer
  index = dissect.number_of_special_fields(buffer, index, packet, parent)

  -- Special Field: Struct of 3 fields
  local special_field_count = buffer(index - 1, 1):int()
  for i = 1, special_field_count do
    index = dissect.special_field(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Special Field Message
dissect.special_field_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.special_field_message then
    local length = size_of.special_field_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.special_field_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.special_field_message, range, display)
  end

  return dissect.special_field_message_fields(buffer, offset, packet, parent)
end

-- Size: Num Decimals Options Price
size_of.num_decimals_options_price = 1

-- Display: Num Decimals Options Price
display.num_decimals_options_price = function(value)
  return "Num Decimals Options Price: "..value
end

-- Dissect: Num Decimals Options Price
dissect.num_decimals_options_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.num_decimals_options_price)
  local value = range:string()
  local display = display.num_decimals_options_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.num_decimals_options_price, range, value, display)

  return offset + size_of.num_decimals_options_price
end

-- Size: ISIN
size_of.isin = 12

-- Display: ISIN
display.isin = function(value)
  return "ISIN: "..value
end

-- Dissect: ISIN
dissect.isin = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.isin)
  local value = range:string()
  local display = display.isin(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.isin, range, value, display)

  return offset + size_of.isin
end

-- Size: Off Exchange Increment Option Price
size_of.off_exchange_increment_option_price = 4

-- Display: Off Exchange Increment Option Price
display.off_exchange_increment_option_price = function(value)
  return "Off Exchange Increment Option Price: "..value
end

-- Dissect: Off Exchange Increment Option Price
dissect.off_exchange_increment_option_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.off_exchange_increment_option_price)
  local value = range:int()
  local display = display.off_exchange_increment_option_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.off_exchange_increment_option_price, range, value, display)

  return offset + size_of.off_exchange_increment_option_price
end

-- Size: Off Exchange Increment Price
size_of.off_exchange_increment_price = 4

-- Display: Off Exchange Increment Price
display.off_exchange_increment_price = function(value)
  return "Off Exchange Increment Price: "..value
end

-- Dissect: Off Exchange Increment Price
dissect.off_exchange_increment_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.off_exchange_increment_price)
  local value = range:int()
  local display = display.off_exchange_increment_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.off_exchange_increment_price, range, value, display)

  return offset + size_of.off_exchange_increment_price
end

-- Size: Off Exchange Increment Qty
size_of.off_exchange_increment_qty = 4

-- Display: Off Exchange Increment Qty
display.off_exchange_increment_qty = function(value)
  return "Off Exchange Increment Qty: "..value
end

-- Dissect: Off Exchange Increment Qty
dissect.off_exchange_increment_qty = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.off_exchange_increment_qty)
  local value = range:int()
  local display = display.off_exchange_increment_qty(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.off_exchange_increment_qty, range, value, display)

  return offset + size_of.off_exchange_increment_qty
end

-- Size: Off Exchange Increment Qty Denominator
size_of.off_exchange_increment_qty_denominator = 1

-- Display: Off Exchange Increment Qty Denominator
display.off_exchange_increment_qty_denominator = function(value)
  return "Off Exchange Increment Qty Denominator: "..value
end

-- Dissect: Off Exchange Increment Qty Denominator
dissect.off_exchange_increment_qty_denominator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.off_exchange_increment_qty_denominator)
  local value = range:string()
  local display = display.off_exchange_increment_qty_denominator(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.off_exchange_increment_qty_denominator, range, value, display)

  return offset + size_of.off_exchange_increment_qty_denominator
end

-- Size: MIC Code
size_of.mic_code = 4

-- Display: MIC Code
display.mic_code = function(value)
  return "MIC Code: "..value
end

-- Dissect: MIC Code
dissect.mic_code = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.mic_code)
  local value = range:string()
  local display = display.mic_code(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.mic_code, range, value, display)

  return offset + size_of.mic_code
end

-- Size: Strip Name
size_of.strip_name = 39

-- Display: Strip Name
display.strip_name = function(value)
  return "Strip Name: "..value
end

-- Dissect: Strip Name
dissect.strip_name = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.strip_name)
  local value = range:string()
  local display = display.strip_name(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.strip_name, range, value, display)

  return offset + size_of.strip_name
end

-- Size: Strip ID
size_of.strip_id = 4

-- Display: Strip ID
display.strip_id = function(value)
  return "Strip ID: "..value
end

-- Dissect: Strip ID
dissect.strip_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.strip_id)
  local value = range:int()
  local display = display.strip_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.strip_id, range, value, display)

  return offset + size_of.strip_id
end

-- Size: Hub Alias
size_of.hub_alias = 80

-- Display: Hub Alias
display.hub_alias = function(value)
  return "Hub Alias: "..value
end

-- Dissect: Hub Alias
dissect.hub_alias = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hub_alias)
  local value = range:string()
  local display = display.hub_alias(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hub_alias, range, value, display)

  return offset + size_of.hub_alias
end

-- Size: Hub ID
size_of.hub_id = 4

-- Display: Hub ID
display.hub_id = function(value)
  return "Hub ID: "..value
end

-- Dissect: Hub ID
dissect.hub_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hub_id)
  local value = range:int()
  local display = display.hub_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hub_id, range, value, display)

  return offset + size_of.hub_id
end

-- Size: Product Name
size_of.product_name = 62

-- Display: Product Name
display.product_name = function(value)
  return "Product Name: "..value
end

-- Dissect: Product Name
dissect.product_name = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.product_name)
  local value = range:string()
  local display = display.product_name(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.product_name, range, value, display)

  return offset + size_of.product_name
end

-- Size: Product ID
size_of.product_id = 4

-- Display: Product ID
display.product_id = function(value)
  return "Product ID: "..value
end

-- Dissect: Product ID
dissect.product_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.product_id)
  local value = range:int()
  local display = display.product_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.product_id, range, value, display)

  return offset + size_of.product_id
end

-- Size: Max Price
size_of.max_price = 8

-- Display: Max Price
display.max_price = function(value)
  return "Max Price: "..value
end

-- Dissect: Max Price
dissect.max_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.max_price)
  local value = range:int64()
  local display = display.max_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.max_price, range, value, display)

  return offset + size_of.max_price
end

-- Size: Min Price
size_of.min_price = 8

-- Display: Min Price
display.min_price = function(value)
  return "Min Price: "..value
end

-- Dissect: Min Price
dissect.min_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.min_price)
  local value = range:int64()
  local display = display.min_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.min_price, range, value, display)

  return offset + size_of.min_price
end

-- Size: Cleared Alias
size_of.cleared_alias = 15

-- Display: Cleared Alias
display.cleared_alias = function(value)
  return "Cleared Alias: "..value
end

-- Dissect: Cleared Alias
dissect.cleared_alias = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.cleared_alias)
  local value = range:string()
  local display = display.cleared_alias(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.cleared_alias, range, value, display)

  return offset + size_of.cleared_alias
end

-- Size: Unit Quantity
size_of.unit_quantity = 4

-- Display: Unit Quantity
display.unit_quantity = function(value)
  return "Unit Quantity: "..value
end

-- Dissect: Unit Quantity
dissect.unit_quantity = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.unit_quantity)
  local value = range:int()
  local display = display.unit_quantity(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.unit_quantity, range, value, display)

  return offset + size_of.unit_quantity
end

-- Size: Maturity Day
size_of.maturity_day = 2

-- Display: Maturity Day
display.maturity_day = function(value)
  return "Maturity Day: "..value
end

-- Dissect: Maturity Day
dissect.maturity_day = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.maturity_day)
  local value = range:int()
  local display = display.maturity_day(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.maturity_day, range, value, display)

  return offset + size_of.maturity_day
end

-- Size: Maturity Month
size_of.maturity_month = 2

-- Display: Maturity Month
display.maturity_month = function(value)
  return "Maturity Month: "..value
end

-- Dissect: Maturity Month
dissect.maturity_month = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.maturity_month)
  local value = range:int()
  local display = display.maturity_month(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.maturity_month, range, value, display)

  return offset + size_of.maturity_month
end

-- Size: Maturity Year
size_of.maturity_year = 2

-- Display: Maturity Year
display.maturity_year = function(value)
  return "Maturity Year: "..value
end

-- Dissect: Maturity Year
dissect.maturity_year = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.maturity_year)
  local value = range:int()
  local display = display.maturity_year(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.maturity_year, range, value, display)

  return offset + size_of.maturity_year
end

-- Display: New Expiry Message
display.new_expiry_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: New Expiry Message
dissect.new_expiry_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Market Type ID: 2 Byte Signed Fixed Width Integer
  index = dissect.market_type_id(buffer, index, packet, parent)

  -- Order Price Denominator: 1 Byte Ascii String
  index = dissect.order_price_denominator(buffer, index, packet, parent)

  -- Increment Price: 4 Byte Signed Fixed Width Integer
  index = dissect.increment_price(buffer, index, packet, parent)

  -- Increment Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.increment_qty(buffer, index, packet, parent)

  -- Lot Size: 4 Byte Signed Fixed Width Integer
  index = dissect.lot_size(buffer, index, packet, parent)

  -- Market Desc: 120 Byte Ascii String
  index = dissect.market_desc(buffer, index, packet, parent)

  -- Maturity Year: 2 Byte Signed Fixed Width Integer
  index = dissect.maturity_year(buffer, index, packet, parent)

  -- Maturity Month: 2 Byte Signed Fixed Width Integer
  index = dissect.maturity_month(buffer, index, packet, parent)

  -- Maturity Day: 2 Byte Signed Fixed Width Integer
  index = dissect.maturity_day(buffer, index, packet, parent)

  -- Deal Price Denominator: 1 Byte Ascii String
  index = dissect.deal_price_denominator(buffer, index, packet, parent)

  -- Min Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.min_qty(buffer, index, packet, parent)

  -- Unit Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.unit_quantity(buffer, index, packet, parent)

  -- Currency: 20 Byte Ascii String
  index = dissect.currency(buffer, index, packet, parent)

  -- Cleared Alias: 15 Byte Ascii String
  index = dissect.cleared_alias(buffer, index, packet, parent)

  -- Min Price: 8 Byte Signed Fixed Width Integer
  index = dissect.min_price(buffer, index, packet, parent)

  -- Max Price: 8 Byte Signed Fixed Width Integer
  index = dissect.max_price(buffer, index, packet, parent)

  -- Product ID: 4 Byte Signed Fixed Width Integer
  index = dissect.product_id(buffer, index, packet, parent)

  -- Product Name: 62 Byte Ascii String
  index = dissect.product_name(buffer, index, packet, parent)

  -- Hub ID: 4 Byte Signed Fixed Width Integer
  index = dissect.hub_id(buffer, index, packet, parent)

  -- Hub Alias: 80 Byte Ascii String
  index = dissect.hub_alias(buffer, index, packet, parent)

  -- Strip ID: 4 Byte Signed Fixed Width Integer
  index = dissect.strip_id(buffer, index, packet, parent)

  -- Strip Name: 39 Byte Ascii String
  index = dissect.strip_name(buffer, index, packet, parent)

  -- Settle Price Denominator: 1 Byte Ascii String
  index = dissect.settle_price_denominator(buffer, index, packet, parent)

  -- MIC Code: 4 Byte Ascii String
  index = dissect.mic_code(buffer, index, packet, parent)

  -- Unit Qty Denominator: 1 Byte Ascii String
  index = dissect.unit_qty_denominator(buffer, index, packet, parent)

  -- Off Exchange Increment Qty Denominator: 1 Byte Ascii String
  index = dissect.off_exchange_increment_qty_denominator(buffer, index, packet, parent)

  -- Off Exchange Increment Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.off_exchange_increment_qty(buffer, index, packet, parent)

  -- Off Exchange Increment Price: 4 Byte Signed Fixed Width Integer
  index = dissect.off_exchange_increment_price(buffer, index, packet, parent)

  -- Off Exchange Increment Option Price: 4 Byte Signed Fixed Width Integer
  index = dissect.off_exchange_increment_option_price(buffer, index, packet, parent)

  -- Contract Symbol: 35 Byte Ascii String
  index = dissect.contract_symbol(buffer, index, packet, parent)

  -- ISIN: 12 Byte Ascii String
  index = dissect.isin(buffer, index, packet, parent)

  -- Num Decimals Options Price: 1 Byte Ascii String
  index = dissect.num_decimals_options_price(buffer, index, packet, parent)

  -- Hedge Market ID: 4 Byte Unsigned Fixed Width Integer
  index = dissect.hedge_market_id(buffer, index, packet, parent)

  -- Settlement Type: 1 Byte Ascii String Enum with 2 values
  index = dissect.settlement_type(buffer, index, packet, parent)

  -- GT Allowed: 1 Byte Ascii String Enum with 2 values
  index = dissect.gt_allowed(buffer, index, packet, parent)

  -- Cross Order Supported: 1 Byte Ascii String Enum with 2 values
  index = dissect.cross_order_supported(buffer, index, packet, parent)

  -- Unit Of Measure: 30 Byte Ascii String
  index = dissect.unit_of_measure(buffer, index, packet, parent)

  -- MIFID Regulated Market: 1 Byte Ascii String Enum with 2 values
  index = dissect.mifid_regulated_market(buffer, index, packet, parent)

  -- Screen Last Trade Year: 2 Byte Signed Fixed Width Integer
  index = dissect.screen_last_trade_year(buffer, index, packet, parent)

  -- Screen Last Trade Month: 2 Byte Signed Fixed Width Integer
  index = dissect.screen_last_trade_month(buffer, index, packet, parent)

  -- Screen Last Trade Day: 2 Byte Signed Fixed Width Integer
  index = dissect.screen_last_trade_day(buffer, index, packet, parent)

  return index
end

-- Dissect: New Expiry Message
dissect.new_expiry_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.new_expiry_message then
    local range = buffer(offset, 509)
    local display = display.new_expiry_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.new_expiry_message, range, display)
  end

  return dissect.new_expiry_message_fields(buffer, offset, packet, parent)
end

-- Size: Underlying ISIN
size_of.underlying_isin = 12

-- Display: Underlying ISIN
display.underlying_isin = function(value)
  return "Underlying ISIN: "..value
end

-- Dissect: Underlying ISIN
dissect.underlying_isin = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.underlying_isin)
  local value = range:string()
  local display = display.underlying_isin(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.underlying_isin, range, value, display)

  return offset + size_of.underlying_isin
end

-- Size: Exchange Silo
size_of.exchange_silo = 1

-- Display: Exchange Silo
display.exchange_silo = function(value)
  if value == "0" then
    return "Exchange Silo: ICE (0)"
  end
  if value == "1" then
    return "Exchange Silo: Endex (1)"
  end
  if value == "2" then
    return "Exchange Silo: LIFFE (2)"
  end

  return "Exchange Silo: Unknown("..value..")"
end

-- Dissect: Exchange Silo
dissect.exchange_silo = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.exchange_silo)
  local value = range:string()
  local display = display.exchange_silo(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.exchange_silo, range, value, display)

  return offset + size_of.exchange_silo
end

-- Size: Hedge Only
size_of.hedge_only = 1

-- Display: Hedge Only
display.hedge_only = function(value)
  if value == "Y" then
    return "Hedge Only: Yes (Y)"
  end
  if value == "N" then
    return "Hedge Only: No (N)"
  end

  return "Hedge Only: Unknown("..value..")"
end

-- Dissect: Hedge Only
dissect.hedge_only = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.hedge_only)
  local value = range:string()
  local display = display.hedge_only(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.hedge_only, range, value, display)

  return offset + size_of.hedge_only
end

-- Size: Is Tradable
size_of.is_tradable = 1

-- Display: Is Tradable
display.is_tradable = function(value)
  if value == "Y" then
    return "Is Tradable: Yes (Y)"
  end
  if value == "N" then
    return "Is Tradable: No (N)"
  end

  return "Is Tradable: Unknown("..value..")"
end

-- Dissect: Is Tradable
dissect.is_tradable = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_tradable)
  local value = range:string()
  local display = display.is_tradable(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_tradable, range, value, display)

  return offset + size_of.is_tradable
end

-- Size: Allows Implied
size_of.allows_implied = 1

-- Display: Allows Implied
display.allows_implied = function(value)
  if value == "Y" then
    return "Allows Implied: Yes (Y)"
  end
  if value == "N" then
    return "Allows Implied: No (N)"
  end

  return "Allows Implied: Unknown("..value..")"
end

-- Dissect: Allows Implied
dissect.allows_implied = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.allows_implied)
  local value = range:string()
  local display = display.allows_implied(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.allows_implied, range, value, display)

  return offset + size_of.allows_implied
end

-- Size: Allow Options
size_of.allow_options = 1

-- Display: Allow Options
display.allow_options = function(value)
  if value == "Y" then
    return "Allow Options: Yes (Y)"
  end
  if value == "N" then
    return "Allow Options: No (N)"
  end

  return "Allow Options: Unknown("..value..")"
end

-- Dissect: Allow Options
dissect.allow_options = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.allow_options)
  local value = range:string()
  local display = display.allow_options(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.allow_options, range, value, display)

  return offset + size_of.allow_options
end

-- Size: Reserved Bytes4
size_of.reserved_bytes4 = 4

-- Display: Reserved Bytes4
display.reserved_bytes4 = function(value)
  return "Reserved Bytes4: "..value
end

-- Dissect: Reserved Bytes4
dissect.reserved_bytes4 = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.reserved_bytes4)
  local value = range:int()
  local display = display.reserved_bytes4(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.reserved_bytes4, range, value, display)

  return offset + size_of.reserved_bytes4
end

-- Display: Leg Definition
display.leg_definition = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Leg Definition
dissect.leg_definition_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Leg Body Length: 1 Byte Unsigned Fixed Width Integer
  index = dissect.leg_body_length(buffer, index, packet, parent)

  -- Leg Market Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_market_id(buffer, index, packet, parent)

  -- Leg Ratio: 2 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio(buffer, index, packet, parent)

  -- Leg Side: 1 Byte Ascii String
  index = dissect.leg_side(buffer, index, packet, parent)

  -- Leg Strategy Code: 2 Byte Unsigned Fixed Width Integer
  index = dissect.leg_strategy_code(buffer, index, packet, parent)

  -- Leg Ratio Qty Numerator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio_qty_numerator(buffer, index, packet, parent)

  -- Leg Ratio Qty Denominator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio_qty_denominator(buffer, index, packet, parent)

  -- Leg Ratio Price Numerator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio_price_numerator(buffer, index, packet, parent)

  -- Leg Ratio Price Denominator: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio_price_denominator(buffer, index, packet, parent)

  return index
end

-- Dissect: Leg Definition
dissect.leg_definition = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.leg_definition then
    local range = buffer(offset, 26)
    local display = display.leg_definition(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.leg_definition, range, display)
  end

  return dissect.leg_definition_fields(buffer, offset, packet, parent)
end

-- Size: Number Of Leg Definitions
size_of.number_of_leg_definitions = 1

-- Display: Number Of Leg Definitions
display.number_of_leg_definitions = function(value)
  return "Number Of Leg Definitions: "..value
end

-- Dissect: Number Of Leg Definitions
dissect.number_of_leg_definitions = function(buffer, offset, packet, parent)
  local length = 1
  local range = buffer(offset, length)
  local value = range:int()
  local display = display.number_of_leg_definitions(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.number_of_leg_definitions, range, value, display)

  return offset + length, value
end

-- Calculate runtime size: New Futures Strategy Definition Message
size_of.new_futures_strategy_definition_message = function(buffer, offset)
  local index = 0

  index = index + 89

  -- Calculate field size from count
  local leg_definition_count = buffer(offset + index - 1, 1):int()
  index = index + leg_definition_count * 26

  return index
end

-- Display: New Futures Strategy Definition Message
display.new_futures_strategy_definition_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: New Futures Strategy Definition Message
dissect.new_futures_strategy_definition_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Futures Contract Symbol: 70 Byte Ascii String
  index = dissect.futures_contract_symbol(buffer, index, packet, parent)

  -- Trading Status: 1 Byte Ascii String Enum with 5 values
  index = dissect.trading_status(buffer, index, packet, parent)

  -- Order Price Denominator: 1 Byte Ascii String
  index = dissect.order_price_denominator(buffer, index, packet, parent)

  -- Increment Price: 4 Byte Signed Fixed Width Integer
  index = dissect.increment_price(buffer, index, packet, parent)

  -- Increment Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.increment_qty(buffer, index, packet, parent)

  -- Min Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.min_qty(buffer, index, packet, parent)

  -- Number Of Leg Definitions: 1 Byte Signed Fixed Width Integer
  index = dissect.number_of_leg_definitions(buffer, index, packet, parent)

  -- Leg Definition: Struct of 9 fields
  local leg_definition_count = buffer(index - 1, 1):int()
  for i = 1, leg_definition_count do
    index = dissect.leg_definition(buffer, index, packet, parent)
  end

  -- Security Sub Type: 2 Byte Signed Fixed Width Integer
  index = dissect.security_sub_type(buffer, index, packet, parent)

  -- Is Block Only: 1 Byte Ascii String Enum with 2 values
  index = dissect.is_block_only(buffer, index, packet, parent)

  -- Strategy Symbol: 18 Byte Ascii String
  index = dissect.strategy_symbol(buffer, index, packet, parent)

  -- GT Allowed: 1 Byte Ascii String Enum with 2 values
  index = dissect.gt_allowed(buffer, index, packet, parent)

  -- Reserved Bytes4: 4 Byte Signed Fixed Width Integer
  index = dissect.reserved_bytes4(buffer, index, packet, parent)

  -- MIFID Regulated Market: 1 Byte Ascii String Enum with 2 values
  index = dissect.mifid_regulated_market(buffer, index, packet, parent)

  -- Market Desc: 120 Byte Ascii String
  index = dissect.market_desc(buffer, index, packet, parent)

  -- Maturity Year: 2 Byte Signed Fixed Width Integer
  index = dissect.maturity_year(buffer, index, packet, parent)

  -- Maturity Month: 2 Byte Signed Fixed Width Integer
  index = dissect.maturity_month(buffer, index, packet, parent)

  -- Maturity Day: 2 Byte Signed Fixed Width Integer
  index = dissect.maturity_day(buffer, index, packet, parent)

  -- Deal Price Denominator: 1 Byte Ascii String
  index = dissect.deal_price_denominator(buffer, index, packet, parent)

  -- Unit Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.unit_quantity(buffer, index, packet, parent)

  -- Num Decimals Options Price: 1 Byte Ascii String
  index = dissect.num_decimals_options_price(buffer, index, packet, parent)

  -- Allow Options: 1 Byte Ascii String Enum with 2 values
  index = dissect.allow_options(buffer, index, packet, parent)

  -- Cleared Alias: 15 Byte Ascii String
  index = dissect.cleared_alias(buffer, index, packet, parent)

  -- Allows Implied: 1 Byte Ascii String Enum with 2 values
  index = dissect.allows_implied(buffer, index, packet, parent)

  -- Min Price: 8 Byte Signed Fixed Width Integer
  index = dissect.min_price(buffer, index, packet, parent)

  -- Max Price: 8 Byte Signed Fixed Width Integer
  index = dissect.max_price(buffer, index, packet, parent)

  -- Product Name: 62 Byte Ascii String
  index = dissect.product_name(buffer, index, packet, parent)

  -- Hub Alias: 80 Byte Ascii String
  index = dissect.hub_alias(buffer, index, packet, parent)

  -- Strip Name: 39 Byte Ascii String
  index = dissect.strip_name(buffer, index, packet, parent)

  -- Is Tradable: 1 Byte Ascii String Enum with 2 values
  index = dissect.is_tradable(buffer, index, packet, parent)

  -- Settle Price Denominator: 1 Byte Ascii String
  index = dissect.settle_price_denominator(buffer, index, packet, parent)

  -- MIC Code: 4 Byte Ascii String
  index = dissect.mic_code(buffer, index, packet, parent)

  -- Unit Qty Denominator: 1 Byte Ascii String
  index = dissect.unit_qty_denominator(buffer, index, packet, parent)

  -- Hedge Only: 1 Byte Ascii String Enum with 2 values
  index = dissect.hedge_only(buffer, index, packet, parent)

  -- Exchange Silo: 1 Byte Ascii String Enum with 3 values
  index = dissect.exchange_silo(buffer, index, packet, parent)

  -- Off Exchange Increment Qty Denominator: 1 Byte Ascii String
  index = dissect.off_exchange_increment_qty_denominator(buffer, index, packet, parent)

  -- Off Exchange Increment Qty: 4 Byte Signed Fixed Width Integer
  index = dissect.off_exchange_increment_qty(buffer, index, packet, parent)

  -- Off Exchange Increment Price: 4 Byte Signed Fixed Width Integer
  index = dissect.off_exchange_increment_price(buffer, index, packet, parent)

  -- Off Exchange Increment Option Price: 4 Byte Signed Fixed Width Integer
  index = dissect.off_exchange_increment_option_price(buffer, index, packet, parent)

  -- Product ID: 4 Byte Signed Fixed Width Integer
  index = dissect.product_id(buffer, index, packet, parent)

  -- Hub ID: 4 Byte Signed Fixed Width Integer
  index = dissect.hub_id(buffer, index, packet, parent)

  -- Strip ID: 4 Byte Signed Fixed Width Integer
  index = dissect.strip_id(buffer, index, packet, parent)

  -- Underlying ISIN: 12 Byte Ascii String
  index = dissect.underlying_isin(buffer, index, packet, parent)

  -- Test Market Indicator: 1 Byte Ascii String
  index = dissect.test_market_indicator(buffer, index, packet, parent)

  -- Leg Deal Suppressed: 1 Byte Ascii String Enum with 2 values
  index = dissect.leg_deal_suppressed(buffer, index, packet, parent)

  return index
end

-- Dissect: New Futures Strategy Definition Message
dissect.new_futures_strategy_definition_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.new_futures_strategy_definition_message then
    local length = size_of.new_futures_strategy_definition_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.new_futures_strategy_definition_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.new_futures_strategy_definition_message, range, display)
  end

  return dissect.new_futures_strategy_definition_message_fields(buffer, offset, packet, parent)
end

-- Size: IPL Down
size_of.ipl_down = 8

-- Display: IPL Down
display.ipl_down = function(value)
  return "IPL Down: "..value
end

-- Dissect: IPL Down
dissect.ipl_down = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.ipl_down)
  local value = range:int64()
  local display = display.ipl_down(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.ipl_down, range, value, display)

  return offset + size_of.ipl_down
end

-- Size: Ipl Up
size_of.ipl_up = 8

-- Display: Ipl Up
display.ipl_up = function(value)
  return "Ipl Up: "..value
end

-- Dissect: Ipl Up
dissect.ipl_up = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.ipl_up)
  local value = range:int64()
  local display = display.ipl_up(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.ipl_up, range, value, display)

  return offset + size_of.ipl_up
end

-- Size: Ipl Hold Duration
size_of.ipl_hold_duration = 4

-- Display: Ipl Hold Duration
display.ipl_hold_duration = function(value)
  return "Ipl Hold Duration: "..value
end

-- Dissect: Ipl Hold Duration
dissect.ipl_hold_duration = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.ipl_hold_duration)
  local value = range:int()
  local display = display.ipl_hold_duration(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.ipl_hold_duration, range, value, display)

  return offset + size_of.ipl_hold_duration
end

-- Size: Is Up
size_of.is_up = 1

-- Display: Is Up
display.is_up = function(value)
  if value == "Y" then
    return "Is Up: IPL  Upper bound violation (Y)"
  end
  if value == "N" then
    return "Is Up: IPL  Lower bound violation (N)"
  end
  if value == "F" then
    return "Is Up: Final (F)"
  end
  if value == "" then
    return "Is Up: Non  Endex  Spot  Market (<whitespace>)"
  end

  return "Is Up: Unknown("..value..")"
end

-- Dissect: Is Up
dissect.is_up = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_up)
  local value = range:string()
  local display = display.is_up(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_up, range, value, display)

  return offset + size_of.is_up
end

-- Size: Notification Date Time
size_of.notification_date_time = 8

-- Display: Notification Date Time
display.notification_date_time = function(value)
  return "Notification Date Time: "..value
end

-- Dissect: Notification Date Time
dissect.notification_date_time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.notification_date_time)
  local value = range:int64()
  local display = display.notification_date_time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.notification_date_time, range, value, display)

  return offset + size_of.notification_date_time
end

-- Size: IPL Hold Type
size_of.ipl_hold_type = 1

-- Display: IPL Hold Type
display.ipl_hold_type = function(value)
  if value == "S" then
    return "IPL Hold Type: IPL  Hold  Start (S)"
  end
  if value == "E" then
    return "IPL Hold Type: IPL  Hold  End (E)"
  end

  return "IPL Hold Type: Unknown("..value..")"
end

-- Dissect: IPL Hold Type
dissect.ipl_hold_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.ipl_hold_type)
  local value = range:string()
  local display = display.ipl_hold_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.ipl_hold_type, range, value, display)

  return offset + size_of.ipl_hold_type
end

-- Display: Interval Price Limit Notification Message
display.interval_price_limit_notification_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Interval Price Limit Notification Message
dissect.interval_price_limit_notification_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- IPL Hold Type: 1 Byte Ascii String Enum with 2 values
  index = dissect.ipl_hold_type(buffer, index, packet, parent)

  -- Notification Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.notification_date_time(buffer, index, packet, parent)

  -- Is Up: 1 Byte Ascii String Enum with 4 values
  index = dissect.is_up(buffer, index, packet, parent)

  -- Ipl Hold Duration: 4 Byte Signed Fixed Width Integer
  index = dissect.ipl_hold_duration(buffer, index, packet, parent)

  -- Ipl Up: 8 Byte Signed Fixed Width Integer
  index = dissect.ipl_up(buffer, index, packet, parent)

  -- IPL Down: 8 Byte Signed Fixed Width Integer
  index = dissect.ipl_down(buffer, index, packet, parent)

  return index
end

-- Dissect: Interval Price Limit Notification Message
dissect.interval_price_limit_notification_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.interval_price_limit_notification_message then
    local range = buffer(offset, 34)
    local display = display.interval_price_limit_notification_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.interval_price_limit_notification_message, range, display)
  end

  return dissect.interval_price_limit_notification_message_fields(buffer, offset, packet, parent)
end

-- Size: Strip Info
size_of.strip_info = 50

-- Display: Strip Info
display.strip_info = function(value)
  return "Strip Info: "..value
end

-- Dissect: Strip Info
dissect.strip_info = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.strip_info)
  local value = range:string()
  local display = display.strip_info(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.strip_info, range, value, display)

  return offset + size_of.strip_info
end

-- Size: End Day
size_of.end_day = 2

-- Display: End Day
display.end_day = function(value)
  return "End Day: "..value
end

-- Dissect: End Day
dissect.end_day = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.end_day)
  local value = range:int()
  local display = display.end_day(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.end_day, range, value, display)

  return offset + size_of.end_day
end

-- Size: End Month
size_of.end_month = 2

-- Display: End Month
display.end_month = function(value)
  return "End Month: "..value
end

-- Dissect: End Month
dissect.end_month = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.end_month)
  local value = range:int()
  local display = display.end_month(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.end_month, range, value, display)

  return offset + size_of.end_month
end

-- Size: End Year
size_of.end_year = 2

-- Display: End Year
display.end_year = function(value)
  return "End Year: "..value
end

-- Dissect: End Year
dissect.end_year = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.end_year)
  local value = range:int()
  local display = display.end_year(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.end_year, range, value, display)

  return offset + size_of.end_year
end

-- Size: Begin Day
size_of.begin_day = 2

-- Display: Begin Day
display.begin_day = function(value)
  return "Begin Day: "..value
end

-- Dissect: Begin Day
dissect.begin_day = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.begin_day)
  local value = range:int()
  local display = display.begin_day(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.begin_day, range, value, display)

  return offset + size_of.begin_day
end

-- Size: Begin Month
size_of.begin_month = 2

-- Display: Begin Month
display.begin_month = function(value)
  return "Begin Month: "..value
end

-- Dissect: Begin Month
dissect.begin_month = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.begin_month)
  local value = range:int()
  local display = display.begin_month(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.begin_month, range, value, display)

  return offset + size_of.begin_month
end

-- Size: Begin Year
size_of.begin_year = 2

-- Display: Begin Year
display.begin_year = function(value)
  return "Begin Year: "..value
end

-- Dissect: Begin Year
dissect.begin_year = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.begin_year)
  local value = range:int()
  local display = display.begin_year(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.begin_year, range, value, display)

  return offset + size_of.begin_year
end

-- Size: Strip Type
size_of.strip_type = 20

-- Display: Strip Type
display.strip_type = function(value)
  return "Strip Type: "..value
end

-- Dissect: Strip Type
dissect.strip_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.strip_type)
  local value = range:string()
  local display = display.strip_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.strip_type, range, value, display)

  return offset + size_of.strip_type
end

-- Size: Old Strip ID
size_of.old_strip_id = 2

-- Display: Old Strip ID
display.old_strip_id = function(value)
  return "Old Strip ID: "..value
end

-- Dissect: Old Strip ID
dissect.old_strip_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.old_strip_id)
  local value = range:int()
  local display = display.old_strip_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.old_strip_id, range, value, display)

  return offset + size_of.old_strip_id
end

-- Display: Strip Info Message
display.strip_info_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Strip Info Message
dissect.strip_info_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Old Strip ID: 2 Byte Signed Fixed Width Integer
  index = dissect.old_strip_id(buffer, index, packet, parent)

  -- Strip Type: 20 Byte Ascii String
  index = dissect.strip_type(buffer, index, packet, parent)

  -- Begin Year: 2 Byte Signed Fixed Width Integer
  index = dissect.begin_year(buffer, index, packet, parent)

  -- Begin Month: 2 Byte Signed Fixed Width Integer
  index = dissect.begin_month(buffer, index, packet, parent)

  -- Begin Day: 2 Byte Signed Fixed Width Integer
  index = dissect.begin_day(buffer, index, packet, parent)

  -- End Year: 2 Byte Signed Fixed Width Integer
  index = dissect.end_year(buffer, index, packet, parent)

  -- End Month: 2 Byte Signed Fixed Width Integer
  index = dissect.end_month(buffer, index, packet, parent)

  -- End Day: 2 Byte Signed Fixed Width Integer
  index = dissect.end_day(buffer, index, packet, parent)

  -- Strip Info: 50 Byte Ascii String
  index = dissect.strip_info(buffer, index, packet, parent)

  -- Strip ID: 4 Byte Signed Fixed Width Integer
  index = dissect.strip_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Strip Info Message
dissect.strip_info_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.strip_info_message then
    local range = buffer(offset, 88)
    local display = display.strip_info_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.strip_info_message, range, display)
  end

  return dissect.strip_info_message_fields(buffer, offset, packet, parent)
end

-- Size: Pre Open Volume
size_of.pre_open_volume = 4

-- Display: Pre Open Volume
display.pre_open_volume = function(value)
  return "Pre Open Volume: "..value
end

-- Dissect: Pre Open Volume
dissect.pre_open_volume = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.pre_open_volume)
  local value = range:int()
  local display = display.pre_open_volume(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.pre_open_volume, range, value, display)

  return offset + size_of.pre_open_volume
end

-- Size: Has Pre Open Volume
size_of.has_pre_open_volume = 1

-- Display: Has Pre Open Volume
display.has_pre_open_volume = function(value)
  return "Has Pre Open Volume: "..value
end

-- Dissect: Has Pre Open Volume
dissect.has_pre_open_volume = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.has_pre_open_volume)
  local value = range:string()
  local display = display.has_pre_open_volume(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.has_pre_open_volume, range, value, display)

  return offset + size_of.has_pre_open_volume
end

-- Size: Pre Open Price
size_of.pre_open_price = 8

-- Display: Pre Open Price
display.pre_open_price = function(value)
  return "Pre Open Price: "..value
end

-- Dissect: Pre Open Price
dissect.pre_open_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.pre_open_price)
  local value = range:int64()
  local display = display.pre_open_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.pre_open_price, range, value, display)

  return offset + size_of.pre_open_price
end

-- Display: Pre Open Price Indicator Message
display.pre_open_price_indicator_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Pre Open Price Indicator Message
dissect.pre_open_price_indicator_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Pre Open Price: 8 Byte Signed Fixed Width Integer
  index = dissect.pre_open_price(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  -- Has Pre Open Volume: 1 Byte Ascii String
  index = dissect.has_pre_open_volume(buffer, index, packet, parent)

  -- Pre Open Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.pre_open_volume(buffer, index, packet, parent)

  return index
end

-- Dissect: Pre Open Price Indicator Message
dissect.pre_open_price_indicator_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.pre_open_price_indicator_message then
    local range = buffer(offset, 25)
    local display = display.pre_open_price_indicator_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.pre_open_price_indicator_message, range, display)
  end

  return dissect.pre_open_price_indicator_message_fields(buffer, offset, packet, parent)
end

-- Size: Event Type
size_of.event_type = 1

-- Display: Event Type
display.event_type = function(value)
  return "Event Type: "..value
end

-- Dissect: Event Type
dissect.event_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.event_type)
  local value = range:string()
  local display = display.event_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.event_type, range, value, display)

  return offset + size_of.event_type
end

-- Display: Market Event Message
display.market_event_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Market Event Message
dissect.market_event_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Event Type: 1 Byte Ascii String
  index = dissect.event_type(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  return index
end

-- Dissect: Market Event Message
dissect.market_event_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.market_event_message then
    local range = buffer(offset, 13)
    local display = display.market_event_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.market_event_message, range, display)
  end

  return dissect.market_event_message_fields(buffer, offset, packet, parent)
end

-- Size: Opening Price
size_of.opening_price = 8

-- Display: Opening Price
display.opening_price = function(value)
  return "Opening Price: "..value
end

-- Dissect: Opening Price
dissect.opening_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.opening_price)
  local value = range:int64()
  local display = display.opening_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.opening_price, range, value, display)

  return offset + size_of.opening_price
end

-- Size: Volume
size_of.volume = 4

-- Display: Volume
display.volume = function(value)
  return "Volume: "..value
end

-- Dissect: Volume
dissect.volume = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.volume)
  local value = range:int()
  local display = display.volume(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.volume, range, value, display)

  return offset + size_of.volume
end

-- Display: End of Day Market Summary Message
display.end_of_day_market_summary_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: End of Day Market Summary Message
dissect.end_of_day_market_summary_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.volume(buffer, index, packet, parent)

  -- Block Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.block_volume(buffer, index, packet, parent)

  -- EFS Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.efs_volume(buffer, index, packet, parent)

  -- EFP Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.efp_volume(buffer, index, packet, parent)

  -- Opening Price: 8 Byte Signed Fixed Width Integer
  index = dissect.opening_price(buffer, index, packet, parent)

  -- High: 8 Byte Signed Fixed Width Integer
  index = dissect.high(buffer, index, packet, parent)

  -- Low: 8 Byte Signed Fixed Width Integer
  index = dissect.low(buffer, index, packet, parent)

  -- VWAP: 8 Byte Signed Fixed Width Integer
  index = dissect.vwap(buffer, index, packet, parent)

  -- Settlement Price With Deal Price Precision: 8 Byte Signed Fixed Width Integer
  index = dissect.settlement_price_with_deal_price_precision(buffer, index, packet, parent)

  -- Open Interest: 4 Byte Signed Fixed Width Integer
  index = dissect.open_interest(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  -- Settlement Price: 8 Byte Signed Fixed Width Integer
  index = dissect.settlement_price(buffer, index, packet, parent)

  return index
end

-- Dissect: End of Day Market Summary Message
dissect.end_of_day_market_summary_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.end_of_day_market_summary_message then
    local range = buffer(offset, 80)
    local display = display.end_of_day_market_summary_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.end_of_day_market_summary_message, range, display)
  end

  return dissect.end_of_day_market_summary_message_fields(buffer, offset, packet, parent)
end

-- Size: Valuation Date
size_of.valuation_date = 10

-- Display: Valuation Date
display.valuation_date = function(value)
  return "Valuation Date: "..value
end

-- Dissect: Valuation Date
dissect.valuation_date = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.valuation_date)
  local value = range:string()
  local display = display.valuation_date(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.valuation_date, range, value, display)

  return offset + size_of.valuation_date
end

-- Size: Published Date Time
size_of.published_date_time = 8

-- Display: Published Date Time
display.published_date_time = function(value)
  return "Published Date Time: "..value
end

-- Dissect: Published Date Time
dissect.published_date_time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.published_date_time)
  local value = range:int64()
  local display = display.published_date_time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.published_date_time, range, value, display)

  return offset + size_of.published_date_time
end

-- Size: Short Name
size_of.short_name = 30

-- Display: Short Name
display.short_name = function(value)
  return "Short Name: "..value
end

-- Dissect: Short Name
dissect.short_name = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.short_name)
  local value = range:string()
  local display = display.short_name(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.short_name, range, value, display)

  return offset + size_of.short_name
end

-- Display: Index Prices Message
display.index_prices_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Index Prices Message
dissect.index_prices_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Short Name: 30 Byte Ascii String
  index = dissect.short_name(buffer, index, packet, parent)

  -- Published Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.published_date_time(buffer, index, packet, parent)

  -- Valuation Date: 10 Byte Ascii String
  index = dissect.valuation_date(buffer, index, packet, parent)

  -- Status: 1 Byte Ascii String
  index = dissect.status(buffer, index, packet, parent)

  return index
end

-- Dissect: Index Prices Message
dissect.index_prices_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.index_prices_message then
    local range = buffer(offset, 61)
    local display = display.index_prices_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.index_prices_message, range, display)
  end

  return dissect.index_prices_message_fields(buffer, offset, packet, parent)
end

-- Display: Settlement Price Message
display.settlement_price_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Settlement Price Message
dissect.settlement_price_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  -- Is Official: 1 Byte Ascii String Enum with 2 values
  index = dissect.is_official(buffer, index, packet, parent)

  -- Valuation Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.valuation_date_time(buffer, index, packet, parent)

  -- Settlement Price: 8 Byte Signed Fixed Width Integer
  index = dissect.settlement_price(buffer, index, packet, parent)

  return index
end

-- Dissect: Settlement Price Message
dissect.settlement_price_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.settlement_price_message then
    local range = buffer(offset, 25)
    local display = display.settlement_price_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.settlement_price_message, range, display)
  end

  return dissect.settlement_price_message_fields(buffer, offset, packet, parent)
end

-- Size: Close Price
size_of.close_price = 8

-- Display: Close Price
display.close_price = function(value)
  return "Close Price: "..value
end

-- Dissect: Close Price
dissect.close_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.close_price)
  local value = range:int64()
  local display = display.close_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.close_price, range, value, display)

  return offset + size_of.close_price
end

-- Display: Close Price Message
display.close_price_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Close Price Message
dissect.close_price_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Close Price: 8 Byte Signed Fixed Width Integer
  index = dissect.close_price(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  return index
end

-- Dissect: Close Price Message
dissect.close_price_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.close_price_message then
    local range = buffer(offset, 20)
    local display = display.close_price_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.close_price_message, range, display)
  end

  return dissect.close_price_message_fields(buffer, offset, packet, parent)
end

-- Size: Open Price
size_of.open_price = 8

-- Display: Open Price
display.open_price = function(value)
  return "Open Price: "..value
end

-- Dissect: Open Price
dissect.open_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.open_price)
  local value = range:int64()
  local display = display.open_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.open_price, range, value, display)

  return offset + size_of.open_price
end

-- Display: Open Price Message
display.open_price_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Open Price Message
dissect.open_price_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Open Price: 8 Byte Signed Fixed Width Integer
  index = dissect.open_price(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  return index
end

-- Dissect: Open Price Message
dissect.open_price_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.open_price_message then
    local range = buffer(offset, 20)
    local display = display.open_price_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.open_price_message, range, display)
  end

  return dissect.open_price_message_fields(buffer, offset, packet, parent)
end

-- Size: Open Interest Change
size_of.open_interest_change = 4

-- Display: Open Interest Change
display.open_interest_change = function(value)
  return "Open Interest Change: "..value
end

-- Dissect: Open Interest Change
dissect.open_interest_change = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.open_interest_change)
  local value = range:int()
  local display = display.open_interest_change(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.open_interest_change, range, value, display)

  return offset + size_of.open_interest_change
end

-- Display: Open Interest Message
display.open_interest_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Open Interest Message
dissect.open_interest_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Open Interest: 4 Byte Signed Fixed Width Integer
  index = dissect.open_interest(buffer, index, packet, parent)

  -- Open Interest Change: 4 Byte Signed Fixed Width Integer
  index = dissect.open_interest_change(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  -- Open Interest Date: 10 Byte Ascii String
  index = dissect.open_interest_date(buffer, index, packet, parent)

  return index
end

-- Dissect: Open Interest Message
dissect.open_interest_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.open_interest_message then
    local range = buffer(offset, 30)
    local display = display.open_interest_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.open_interest_message, range, display)
  end

  return dissect.open_interest_message_fields(buffer, offset, packet, parent)
end

-- Size: Text Message Extra Fld
size_of.text_message_extra_fld = 800

-- Display: Text Message Extra Fld
display.text_message_extra_fld = function(value)
  return "Text Message Extra Fld: "..value
end

-- Dissect: Text Message Extra Fld
dissect.text_message_extra_fld = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.text_message_extra_fld)
  local value = range:string()
  local display = display.text_message_extra_fld(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.text_message_extra_fld, range, value, display)

  return offset + size_of.text_message_extra_fld
end

-- Size: Text Message
size_of.text_message = 200

-- Display: Text Message
display.text_message = function(value)
  return "Text Message: "..value
end

-- Dissect: Text Message
dissect.text_message = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.text_message)
  local value = range:string()
  local display = display.text_message(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.text_message, range, value, display)

  return offset + size_of.text_message
end

-- Display: System Text Message
display.system_text_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: System Text Message
dissect.system_text_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Text Message: 200 Byte Ascii String
  index = dissect.text_message(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  -- Text Message Extra Fld: 800 Byte Ascii String
  index = dissect.text_message_extra_fld(buffer, index, packet, parent)

  return index
end

-- Dissect: System Text Message
dissect.system_text_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.system_text_message then
    local range = buffer(offset, 1008)
    local display = display.system_text_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.system_text_message, range, display)
  end

  return dissect.system_text_message_fields(buffer, offset, packet, parent)
end

-- Display: Market State Change Message
display.market_state_change_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Market State Change Message
dissect.market_state_change_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Trading Status: 1 Byte Ascii String Enum with 5 values
  index = dissect.trading_status(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  return index
end

-- Dissect: Market State Change Message
dissect.market_state_change_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.market_state_change_message then
    local range = buffer(offset, 13)
    local display = display.market_state_change_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.market_state_change_message, range, display)
  end

  return dissect.market_state_change_message_fields(buffer, offset, packet, parent)
end

-- Display: Market Statistics Message
display.market_statistics_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Market Statistics Message
dissect.market_statistics_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.volume(buffer, index, packet, parent)

  -- Block Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.block_volume(buffer, index, packet, parent)

  -- EFS Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.efs_volume(buffer, index, packet, parent)

  -- EFP Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.efp_volume(buffer, index, packet, parent)

  -- High: 8 Byte Signed Fixed Width Integer
  index = dissect.high(buffer, index, packet, parent)

  -- Low: 8 Byte Signed Fixed Width Integer
  index = dissect.low(buffer, index, packet, parent)

  -- VWAP: 8 Byte Signed Fixed Width Integer
  index = dissect.vwap(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  return index
end

-- Dissect: Market Statistics Message
dissect.market_statistics_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.market_statistics_message then
    local range = buffer(offset, 52)
    local display = display.market_statistics_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.market_statistics_message, range, display)
  end

  return dissect.market_statistics_message_fields(buffer, offset, packet, parent)
end

-- Size: Off Market Trade Type
size_of.off_market_trade_type = 3

-- Display: Off Market Trade Type
display.off_market_trade_type = function(value)
  return "Off Market Trade Type: "..value
end

-- Dissect: Off Market Trade Type
dissect.off_market_trade_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.off_market_trade_type)
  local value = range:string()
  local display = display.off_market_trade_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.off_market_trade_type, range, value, display)

  return offset + size_of.off_market_trade_type
end

-- Size: Old Off Market Trade Type
size_of.old_off_market_trade_type = 1

-- Display: Old Off Market Trade Type
display.old_off_market_trade_type = function(value)
  return "Old Off Market Trade Type: "..value
end

-- Dissect: Old Off Market Trade Type
dissect.old_off_market_trade_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.old_off_market_trade_type)
  local value = range:string()
  local display = display.old_off_market_trade_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.old_off_market_trade_type, range, value, display)

  return offset + size_of.old_off_market_trade_type
end

-- Size: Trade ID
size_of.trade_id = 8

-- Display: Trade ID
display.trade_id = function(value)
  return "Trade ID: "..value
end

-- Dissect: Trade ID
dissect.trade_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.trade_id)
  local value = range:int64()
  local display = display.trade_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.trade_id, range, value, display)

  return offset + size_of.trade_id
end

-- Display: Cancelled Trade Message
display.cancelled_trade_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Cancelled Trade Message
dissect.cancelled_trade_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Trade ID: 8 Byte Signed Fixed Width Integer
  index = dissect.trade_id(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Old Off Market Trade Type: 1 Byte Ascii String
  index = dissect.old_off_market_trade_type(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  -- Off Market Trade Type: 3 Byte Ascii String
  index = dissect.off_market_trade_type(buffer, index, packet, parent)

  return index
end

-- Dissect: Cancelled Trade Message
dissect.cancelled_trade_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.cancelled_trade_message then
    local range = buffer(offset, 36)
    local display = display.cancelled_trade_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.cancelled_trade_message, range, display)
  end

  return dissect.cancelled_trade_message_fields(buffer, offset, packet, parent)
end

-- Size: Investigation  Status
size_of.investigation__status = 1

-- Display: Investigation  Status
display.investigation__status = function(value)
  if value == "1" then
    return "Investigation  Status: Under  Investigation (1)"
  end
  if value == "2" then
    return "Investigation  Status: Investigation  Completed (2)"
  end

  return "Investigation  Status: Unknown("..value..")"
end

-- Dissect: Investigation  Status
dissect.investigation__status = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.investigation__status)
  local value = range:string()
  local display = display.investigation__status(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.investigation__status, range, value, display)

  return offset + size_of.investigation__status
end

-- Display: Investigated Trade Message
display.investigated_trade_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Investigated Trade Message
dissect.investigated_trade_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Trade ID: 8 Byte Signed Fixed Width Integer
  index = dissect.trade_id(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Old Off Market Trade Type: 1 Byte Ascii String
  index = dissect.old_off_market_trade_type(buffer, index, packet, parent)

  -- Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.date_time(buffer, index, packet, parent)

  -- Investigation  Status: 1 Byte Ascii String Enum with 2 values
  index = dissect.investigation__status(buffer, index, packet, parent)

  -- Off Market Trade Type: 3 Byte Ascii String
  index = dissect.off_market_trade_type(buffer, index, packet, parent)

  return index
end

-- Dissect: Investigated Trade Message
dissect.investigated_trade_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.investigated_trade_message then
    local range = buffer(offset, 37)
    local display = display.investigated_trade_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.investigated_trade_message, range, display)
  end

  return dissect.investigated_trade_message_fields(buffer, offset, packet, parent)
end

-- Size: Is System Priced Leg
size_of.is_system_priced_leg = 1

-- Display: Is System Priced Leg
display.is_system_priced_leg = function(value)
  if value == "Y" then
    return "Is System Priced Leg: Yes (Y)"
  end
  if value == "N" then
    return "Is System Priced Leg: No (N)"
  end

  return "Is System Priced Leg: Unknown("..value..")"
end

-- Dissect: Is System Priced Leg
dissect.is_system_priced_leg = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_system_priced_leg)
  local value = range:string()
  local display = display.is_system_priced_leg(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_system_priced_leg, range, value, display)

  return offset + size_of.is_system_priced_leg
end

-- Size: Delivery End Date Time
size_of.delivery_end_date_time = 8

-- Display: Delivery End Date Time
display.delivery_end_date_time = function(value)
  return "Delivery End Date Time: "..value
end

-- Dissect: Delivery End Date Time
dissect.delivery_end_date_time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.delivery_end_date_time)
  local value = range:int64()
  local display = display.delivery_end_date_time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.delivery_end_date_time, range, value, display)

  return offset + size_of.delivery_end_date_time
end

-- Size: Delivery Begin Date Time
size_of.delivery_begin_date_time = 8

-- Display: Delivery Begin Date Time
display.delivery_begin_date_time = function(value)
  return "Delivery Begin Date Time: "..value
end

-- Dissect: Delivery Begin Date Time
dissect.delivery_begin_date_time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.delivery_begin_date_time)
  local value = range:int64()
  local display = display.delivery_begin_date_time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.delivery_begin_date_time, range, value, display)

  return offset + size_of.delivery_begin_date_time
end

-- Size: Transact Date Time
size_of.transact_date_time = 8

-- Display: Transact Date Time
display.transact_date_time = function(value)
  return "Transact Date Time: "..value
end

-- Dissect: Transact Date Time
dissect.transact_date_time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.transact_date_time)
  local value = range:int64()
  local display = display.transact_date_time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.transact_date_time, range, value, display)

  return offset + size_of.transact_date_time
end

-- Display: Spot Market Trade Message
display.spot_market_trade_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Spot Market Trade Message
dissect.spot_market_trade_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Trade ID: 8 Byte Signed Fixed Width Integer
  index = dissect.trade_id(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Transact Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.transact_date_time(buffer, index, packet, parent)

  -- Extra Flags: 1 Byte Signed Fixed Width Integer
  index = dissect.extra_flags(buffer, index, packet, parent)

  -- Delivery Begin Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.delivery_begin_date_time(buffer, index, packet, parent)

  -- Delivery End Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.delivery_end_date_time(buffer, index, packet, parent)

  -- Is System Priced Leg: 1 Byte Ascii String Enum with 2 values
  index = dissect.is_system_priced_leg(buffer, index, packet, parent)

  return index
end

-- Dissect: Spot Market Trade Message
dissect.spot_market_trade_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.spot_market_trade_message then
    local range = buffer(offset, 50)
    local display = display.spot_market_trade_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.spot_market_trade_message, range, display)
  end

  return dissect.spot_market_trade_message_fields(buffer, offset, packet, parent)
end

-- Size: Aggressor Side
size_of.aggressor_side = 1

-- Display: Aggressor Side
display.aggressor_side = function(value)
  if value == "" then
    return "Aggressor Side: None (<whitespace>)"
  end
  if value == "1" then
    return "Aggressor Side: Buy (1)"
  end
  if value == "2" then
    return "Aggressor Side: Sell (2)"
  end

  return "Aggressor Side: Unknown("..value..")"
end

-- Dissect: Aggressor Side
dissect.aggressor_side = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.aggressor_side)
  local value = range:string()
  local display = display.aggressor_side(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.aggressor_side, range, value, display)

  return offset + size_of.aggressor_side
end

-- Size: Is Adjusted Trade
size_of.is_adjusted_trade = 1

-- Display: Is Adjusted Trade
display.is_adjusted_trade = function(value)
  return "Is Adjusted Trade: "..value
end

-- Dissect: Is Adjusted Trade
dissect.is_adjusted_trade = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_adjusted_trade)
  local value = range:string()
  local display = display.is_adjusted_trade(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_adjusted_trade, range, value, display)

  return offset + size_of.is_adjusted_trade
end

-- Size: Is Implied Spread At Market Open
size_of.is_implied_spread_at_market_open = 1

-- Display: Is Implied Spread At Market Open
display.is_implied_spread_at_market_open = function(value)
  return "Is Implied Spread At Market Open: "..value
end

-- Dissect: Is Implied Spread At Market Open
dissect.is_implied_spread_at_market_open = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_implied_spread_at_market_open)
  local value = range:string()
  local display = display.is_implied_spread_at_market_open(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_implied_spread_at_market_open, range, value, display)

  return offset + size_of.is_implied_spread_at_market_open
end

-- Size: System Priced Leg Type
size_of.system_priced_leg_type = 1

-- Display: System Priced Leg Type
display.system_priced_leg_type = function(value)
  if value == "C" then
    return "System Priced Leg Type: System  Priced  Crack  Spread  Leg (C)"
  end
  if value == "S" then
    return "System Priced Leg Type: System Priced Leg (S)"
  end

  return "System Priced Leg Type: Unknown("..value..")"
end

-- Dissect: System Priced Leg Type
dissect.system_priced_leg_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.system_priced_leg_type)
  local value = range:string()
  local display = display.system_priced_leg_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.system_priced_leg_type, range, value, display)

  return offset + size_of.system_priced_leg_type
end

-- Display: Trade Message
display.trade_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Trade Message
dissect.trade_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Trade ID: 8 Byte Signed Fixed Width Integer
  index = dissect.trade_id(buffer, index, packet, parent)

  -- Is System Priced Leg: 1 Byte Ascii String Enum with 2 values
  index = dissect.is_system_priced_leg(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.quantity(buffer, index, packet, parent)

  -- Old Off Market Trade Type: 1 Byte Ascii String
  index = dissect.old_off_market_trade_type(buffer, index, packet, parent)

  -- Transact Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.transact_date_time(buffer, index, packet, parent)

  -- System Priced Leg Type: 1 Byte Ascii String Enum with 2 values
  index = dissect.system_priced_leg_type(buffer, index, packet, parent)

  -- Is Implied Spread At Market Open: 1 Byte Ascii String
  index = dissect.is_implied_spread_at_market_open(buffer, index, packet, parent)

  -- Is Adjusted Trade: 1 Byte Ascii String
  index = dissect.is_adjusted_trade(buffer, index, packet, parent)

  -- Aggressor Side: 1 Byte Ascii String Enum with 3 values
  index = dissect.aggressor_side(buffer, index, packet, parent)

  -- Extra Flags: 1 Byte Signed Fixed Width Integer
  index = dissect.extra_flags(buffer, index, packet, parent)

  -- Off Market Trade Type: 3 Byte Ascii String
  index = dissect.off_market_trade_type(buffer, index, packet, parent)

  -- Sequence Within Millis: 4 Byte Signed Fixed Width Integer
  index = dissect.sequence_within_millis(buffer, index, packet, parent)

  return index
end

-- Dissect: Trade Message
dissect.trade_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.trade_message then
    local range = buffer(offset, 46)
    local display = display.trade_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.trade_message, range, display)
  end

  return dissect.trade_message_fields(buffer, offset, packet, parent)
end

-- Size: Previous Day Settlement Price
size_of.previous_day_settlement_price = 8

-- Display: Previous Day Settlement Price
display.previous_day_settlement_price = function(value)
  return "Previous Day Settlement Price: "..value
end

-- Dissect: Previous Day Settlement Price
dissect.previous_day_settlement_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.previous_day_settlement_price)
  local value = range:int64()
  local display = display.previous_day_settlement_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.previous_day_settlement_price, range, value, display)

  return offset + size_of.previous_day_settlement_price
end

-- Size: Has Previous Day Settlement Price
size_of.has_previous_day_settlement_price = 1

-- Display: Has Previous Day Settlement Price
display.has_previous_day_settlement_price = function(value)
  return "Has Previous Day Settlement Price: "..value
end

-- Dissect: Has Previous Day Settlement Price
dissect.has_previous_day_settlement_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.has_previous_day_settlement_price)
  local value = range:string()
  local display = display.has_previous_day_settlement_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.has_previous_day_settlement_price, range, value, display)

  return offset + size_of.has_previous_day_settlement_price
end

-- Size: Is Settle Price Official
size_of.is_settle_price_official = 1

-- Display: Is Settle Price Official
display.is_settle_price_official = function(value)
  if value == "Y" then
    return "Is Settle Price Official: Yes (Y)"
  end
  if value == "N" then
    return "Is Settle Price Official: No (N)"
  end

  return "Is Settle Price Official: Unknown("..value..")"
end

-- Dissect: Is Settle Price Official
dissect.is_settle_price_official = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.is_settle_price_official)
  local value = range:string()
  local display = display.is_settle_price_official(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.is_settle_price_official, range, value, display)

  return offset + size_of.is_settle_price_official
end

-- Size: Reserved2 Bytes
size_of.reserved2_bytes = 2

-- Display: Reserved2 Bytes
display.reserved2_bytes = function(value)
  return "Reserved2 Bytes: "..value
end

-- Dissect: Reserved2 Bytes
dissect.reserved2_bytes = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.reserved2_bytes)
  local value = range:bytes():tohex(false, " ")
  local display = display.reserved2_bytes(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.reserved2_bytes, range, value, display)

  return offset + size_of.reserved2_bytes
end

-- Size: Last Message Sequence ID
size_of.last_message_sequence_id = 4

-- Display: Last Message Sequence ID
display.last_message_sequence_id = function(value)
  return "Last Message Sequence ID: "..value
end

-- Dissect: Last Message Sequence ID
dissect.last_message_sequence_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.last_message_sequence_id)
  local value = range:int()
  local display = display.last_message_sequence_id(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.last_message_sequence_id, range, value, display)

  return offset + size_of.last_message_sequence_id
end

-- Size: Settle Price Date Time
size_of.settle_price_date_time = 8

-- Display: Settle Price Date Time
display.settle_price_date_time = function(value)
  return "Settle Price Date Time: "..value
end

-- Dissect: Settle Price Date Time
dissect.settle_price_date_time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.settle_price_date_time)
  local value = range:int64()
  local display = display.settle_price_date_time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.settle_price_date_time, range, value, display)

  return offset + size_of.settle_price_date_time
end

-- Size: Last Trade Date Time
size_of.last_trade_date_time = 8

-- Display: Last Trade Date Time
display.last_trade_date_time = function(value)
  return "Last Trade Date Time: "..value
end

-- Dissect: Last Trade Date Time
dissect.last_trade_date_time = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.last_trade_date_time)
  local value = range:int64()
  local display = display.last_trade_date_time(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.last_trade_date_time, range, value, display)

  return offset + size_of.last_trade_date_time
end

-- Size: Last Trade Quantity
size_of.last_trade_quantity = 4

-- Display: Last Trade Quantity
display.last_trade_quantity = function(value)
  return "Last Trade Quantity: "..value
end

-- Dissect: Last Trade Quantity
dissect.last_trade_quantity = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.last_trade_quantity)
  local value = range:int()
  local display = display.last_trade_quantity(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.last_trade_quantity, range, value, display)

  return offset + size_of.last_trade_quantity
end

-- Size: Last Trade Price
size_of.last_trade_price = 8

-- Display: Last Trade Price
display.last_trade_price = function(value)
  return "Last Trade Price: "..value
end

-- Dissect: Last Trade Price
dissect.last_trade_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.last_trade_price)
  local value = range:int64()
  local display = display.last_trade_price(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.last_trade_price, range, value, display)

  return offset + size_of.last_trade_price
end

-- Size: Num Of Book Entries
size_of.num_of_book_entries = 4

-- Display: Num Of Book Entries
display.num_of_book_entries = function(value)
  return "Num Of Book Entries: "..value
end

-- Dissect: Num Of Book Entries
dissect.num_of_book_entries = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.num_of_book_entries)
  local value = range:int()
  local display = display.num_of_book_entries(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.num_of_book_entries, range, value, display)

  return offset + size_of.num_of_book_entries
end

-- Size: Market Type
size_of.market_type = 2

-- Display: Market Type
display.market_type = function(value)
  return "Market Type: "..value
end

-- Dissect: Market Type
dissect.market_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.market_type)
  local value = range:int()
  local display = display.market_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.market_type, range, value, display)

  return offset + size_of.market_type
end

-- Display: Market Snapshot Message
display.market_snapshot_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Market Snapshot Message
dissect.market_snapshot_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Market ID: 4 Byte Signed Fixed Width Integer
  index = dissect.market_id(buffer, index, packet, parent)

  -- Market Type: 2 Byte Signed Fixed Width Integer
  index = dissect.market_type(buffer, index, packet, parent)

  -- Trading Status: 1 Byte Ascii String Enum with 5 values
  index = dissect.trading_status(buffer, index, packet, parent)

  -- Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.volume(buffer, index, packet, parent)

  -- Block Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.block_volume(buffer, index, packet, parent)

  -- EFS Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.efs_volume(buffer, index, packet, parent)

  -- EFP Volume: 4 Byte Signed Fixed Width Integer
  index = dissect.efp_volume(buffer, index, packet, parent)

  -- Open Interest: 4 Byte Signed Fixed Width Integer
  index = dissect.open_interest(buffer, index, packet, parent)

  -- Opening Price: 8 Byte Signed Fixed Width Integer
  index = dissect.opening_price(buffer, index, packet, parent)

  -- Settlement Price With Deal Price Precision: 8 Byte Signed Fixed Width Integer
  index = dissect.settlement_price_with_deal_price_precision(buffer, index, packet, parent)

  -- High: 8 Byte Signed Fixed Width Integer
  index = dissect.high(buffer, index, packet, parent)

  -- Low: 8 Byte Signed Fixed Width Integer
  index = dissect.low(buffer, index, packet, parent)

  -- VWAP: 8 Byte Signed Fixed Width Integer
  index = dissect.vwap(buffer, index, packet, parent)

  -- Num Of Book Entries: 4 Byte Signed Fixed Width Integer
  index = dissect.num_of_book_entries(buffer, index, packet, parent)

  -- Last Trade Price: 8 Byte Signed Fixed Width Integer
  index = dissect.last_trade_price(buffer, index, packet, parent)

  -- Last Trade Quantity: 4 Byte Signed Fixed Width Integer
  index = dissect.last_trade_quantity(buffer, index, packet, parent)

  -- Last Trade Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.last_trade_date_time(buffer, index, packet, parent)

  -- Settle Price Date Time: 8 Byte Signed Fixed Width Integer
  index = dissect.settle_price_date_time(buffer, index, packet, parent)

  -- Last Message Sequence ID: 4 Byte Signed Fixed Width Integer
  index = dissect.last_message_sequence_id(buffer, index, packet, parent)

  -- Reserved2 Bytes: 2 Byte
  index = dissect.reserved2_bytes(buffer, index, packet, parent)

  -- Open Interest Date: 10 Byte Ascii String
  index = dissect.open_interest_date(buffer, index, packet, parent)

  -- Is Settle Price Official: 1 Byte Ascii String Enum with 2 values
  index = dissect.is_settle_price_official(buffer, index, packet, parent)

  -- Settlement Price: 8 Byte Signed Fixed Width Integer
  index = dissect.settlement_price(buffer, index, packet, parent)

  -- Has Previous Day Settlement Price: 1 Byte Ascii String
  index = dissect.has_previous_day_settlement_price(buffer, index, packet, parent)

  -- Previous Day Settlement Price: 8 Byte Signed Fixed Width Integer
  index = dissect.previous_day_settlement_price(buffer, index, packet, parent)

  return index
end

-- Dissect: Market Snapshot Message
dissect.market_snapshot_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.market_snapshot_message then
    local range = buffer(offset, 133)
    local display = display.market_snapshot_message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.market_snapshot_message, range, display)
  end

  return dissect.market_snapshot_message_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Payload
size_of.payload = function(buffer, offset, code)
  -- Size of Market Snapshot Message
  if code == "C" then
    return 133
  end
  -- Size of Trade Message
  if code == "G" then
    return 46
  end
  -- Size of Spot Market Trade Message
  if code == "Y" then
    return 50
  end
  -- Size of Investigated Trade Message
  if code == "H" then
    return 37
  end
  -- Size of Cancelled Trade Message
  if code == "I" then
    return 36
  end
  -- Size of Market Statistics Message
  if code == "J" then
    return 52
  end
  -- Size of Market State Change Message
  if code == "K" then
    return 13
  end
  -- Size of System Text Message
  if code == "L" then
    return 1008
  end
  -- Size of Open Interest Message
  if code == "M" then
    return 30
  end
  -- Size of Open Price Message
  if code == "N" then
    return 20
  end
  -- Size of Close Price Message
  if code == "c" then
    return 20
  end
  -- Size of Settlement Price Message
  if code == "O" then
    return 25
  end
  -- Size of Index Prices Message
  if code == "z" then
    return 61
  end
  -- Size of End of Day Market Summary Message
  if code == "u" then
    return 80
  end
  -- Size of Market Event Message
  if code == "f" then
    return 13
  end
  -- Size of Pre Open Price Indicator Message
  if code == "g" then
    return 25
  end
  -- Size of Strip Info Message
  if code == "i" then
    return 88
  end
  -- Size of Interval Price Limit Notification Message
  if code == "V" then
    return 34
  end
  -- Size of New Futures Strategy Definition Message
  if code == "9" then
    return size_of.new_futures_strategy_definition_message(buffer, offset)
  end
  -- Size of New Expiry Message
  if code == "R" then
    return 509
  end
  -- Size of Special Field Message
  if code == "b" then
    return size_of.special_field_message(buffer, offset)
  end
  -- Size of Market Snapshot Order Message
  if code == "D" then
    return 41
  end
  -- Size of Add or Modify Order Message
  if code == "E" then
    return 50
  end
  -- Size of Delete Order Message
  if code == "F" then
    return 24
  end
  -- Size of Message Bundle Marker
  if code == "T" then
    return 1
  end
  -- Size of Fixing Transition Message
  if code == "3" then
    return 25
  end
  -- Size of Fixing Lockdown Message
  if code == "4" then
    return 78
  end
  -- Size of Fixing Indicative Price Message  Message
  if code == "0" then
    return 25
  end
  -- Size of Market Snapshot Price Level Message
  if code == "m" then
    return 26
  end
  -- Size of Add Price Level Message
  if code == "t" then
    return 34
  end
  -- Size of Change Price Level Message
  if code == "s" then
    return 34
  end
  -- Size of Delete Price Level Message
  if code == "r" then
    return 14
  end
  -- Size of New Options Strategy Definition Message
  if code == "U" then
    return size_of.new_options_strategy_definition_message(buffer, offset)
  end
  -- Size of New Options Market Definition Message
  if code == "l" then
    return 328
  end
  -- Size of RFQ Message
  if code == "k" then
    return 31
  end
  -- Size of Option Open Interest Message
  if code == "v" then
    return 26
  end
  -- Size of Option Settlement Price Message
  if code == "w" then
    return 53
  end
  -- Size of Old Style Options Trade and Market Stats Message
  if code == "W" then
    return 36
  end

  return 0
end

-- Display: Payload
display.payload = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches:
dissect.payload_branches = function(buffer, offset, packet, parent, code)
  -- Dissect Market Snapshot Message
  if code == "C" then
    return dissect.market_snapshot_message(buffer, offset, packet, parent)
  end
  -- Dissect Trade Message
  if code == "G" then
    return dissect.trade_message(buffer, offset, packet, parent)
  end
  -- Dissect Spot Market Trade Message
  if code == "Y" then
    return dissect.spot_market_trade_message(buffer, offset, packet, parent)
  end
  -- Dissect Investigated Trade Message
  if code == "H" then
    return dissect.investigated_trade_message(buffer, offset, packet, parent)
  end
  -- Dissect Cancelled Trade Message
  if code == "I" then
    return dissect.cancelled_trade_message(buffer, offset, packet, parent)
  end
  -- Dissect Market Statistics Message
  if code == "J" then
    return dissect.market_statistics_message(buffer, offset, packet, parent)
  end
  -- Dissect Market State Change Message
  if code == "K" then
    return dissect.market_state_change_message(buffer, offset, packet, parent)
  end
  -- Dissect System Text Message
  if code == "L" then
    return dissect.system_text_message(buffer, offset, packet, parent)
  end
  -- Dissect Open Interest Message
  if code == "M" then
    return dissect.open_interest_message(buffer, offset, packet, parent)
  end
  -- Dissect Open Price Message
  if code == "N" then
    return dissect.open_price_message(buffer, offset, packet, parent)
  end
  -- Dissect Close Price Message
  if code == "c" then
    return dissect.close_price_message(buffer, offset, packet, parent)
  end
  -- Dissect Settlement Price Message
  if code == "O" then
    return dissect.settlement_price_message(buffer, offset, packet, parent)
  end
  -- Dissect Index Prices Message
  if code == "z" then
    return dissect.index_prices_message(buffer, offset, packet, parent)
  end
  -- Dissect End of Day Market Summary Message
  if code == "u" then
    return dissect.end_of_day_market_summary_message(buffer, offset, packet, parent)
  end
  -- Dissect Market Event Message
  if code == "f" then
    return dissect.market_event_message(buffer, offset, packet, parent)
  end
  -- Dissect Pre Open Price Indicator Message
  if code == "g" then
    return dissect.pre_open_price_indicator_message(buffer, offset, packet, parent)
  end
  -- Dissect Strip Info Message
  if code == "i" then
    return dissect.strip_info_message(buffer, offset, packet, parent)
  end
  -- Dissect Interval Price Limit Notification Message
  if code == "V" then
    return dissect.interval_price_limit_notification_message(buffer, offset, packet, parent)
  end
  -- Dissect New Futures Strategy Definition Message
  if code == "9" then
    return dissect.new_futures_strategy_definition_message(buffer, offset, packet, parent)
  end
  -- Dissect New Expiry Message
  if code == "R" then
    return dissect.new_expiry_message(buffer, offset, packet, parent)
  end
  -- Dissect Special Field Message
  if code == "b" then
    return dissect.special_field_message(buffer, offset, packet, parent)
  end
  -- Dissect Market Snapshot Order Message
  if code == "D" then
    return dissect.market_snapshot_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Add or Modify Order Message
  if code == "E" then
    return dissect.add_or_modify_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Delete Order Message
  if code == "F" then
    return dissect.delete_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Message Bundle Marker
  if code == "T" then
    return dissect.message_bundle_marker(buffer, offset, packet, parent)
  end
  -- Dissect Fixing Transition Message
  if code == "3" then
    return dissect.fixing_transition_message(buffer, offset, packet, parent)
  end
  -- Dissect Fixing Lockdown Message
  if code == "4" then
    return dissect.fixing_lockdown_message(buffer, offset, packet, parent)
  end
  -- Dissect Fixing Indicative Price Message  Message
  if code == "0" then
    return dissect.fixing_indicative_price_message__message(buffer, offset, packet, parent)
  end
  -- Dissect Market Snapshot Price Level Message
  if code == "m" then
    return dissect.market_snapshot_price_level_message(buffer, offset, packet, parent)
  end
  -- Dissect Add Price Level Message
  if code == "t" then
    return dissect.add_price_level_message(buffer, offset, packet, parent)
  end
  -- Dissect Change Price Level Message
  if code == "s" then
    return dissect.change_price_level_message(buffer, offset, packet, parent)
  end
  -- Dissect Delete Price Level Message
  if code == "r" then
    return dissect.delete_price_level_message(buffer, offset, packet, parent)
  end
  -- Dissect New Options Strategy Definition Message
  if code == "U" then
    return dissect.new_options_strategy_definition_message(buffer, offset, packet, parent)
  end
  -- Dissect New Options Market Definition Message
  if code == "l" then
    return dissect.new_options_market_definition_message(buffer, offset, packet, parent)
  end
  -- Dissect RFQ Message
  if code == "k" then
    return dissect.rfq_message(buffer, offset, packet, parent)
  end
  -- Dissect Option Open Interest Message
  if code == "v" then
    return dissect.option_open_interest_message(buffer, offset, packet, parent)
  end
  -- Dissect Option Settlement Price Message
  if code == "w" then
    return dissect.option_settlement_price_message(buffer, offset, packet, parent)
  end
  -- Dissect Old Style Options Trade and Market Stats Message
  if code == "W" then
    return dissect.old_style_options_trade_and_market_stats_message(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Payload
dissect.payload = function(buffer, offset, packet, parent, code)
  if not show.payload then
    return dissect.payload_branches(buffer, offset, packet, parent, code)
  end

  -- Calculate size and check that branch is not empty
  local size = size_of.payload(buffer, offset, code)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = display.payload(buffer, packet, parent)
  local element = parent:add(ice_mdf_impact_v1_1_33.fields.payload, range, display)

  return dissect.payload_branches(buffer, offset, packet, parent, code)
end

-- Size: Length
size_of.length = 2

-- Display: Length
display.length = function(value)
  return "Length: "..value
end

-- Dissect: Length
dissect.length = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.length)
  local value = range:uint()
  local display = display.length(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.length, range, value, display)

  return offset + size_of.length
end

-- Size: Message Type
size_of.message_type = 1

-- Display: Message Type
display.message_type = function(value)
  if value == "C" then
    return "Message Type: Market Snapshot Message (C)"
  end
  if value == "G" then
    return "Message Type: Trade Message (G)"
  end
  if value == "Y" then
    return "Message Type: Spot Market Trade Message (Y)"
  end
  if value == "H" then
    return "Message Type: Investigated Trade Message (H)"
  end
  if value == "I" then
    return "Message Type: Cancelled Trade Message (I)"
  end
  if value == "J" then
    return "Message Type: Market Statistics Message (J)"
  end
  if value == "K" then
    return "Message Type: Market State Change Message (K)"
  end
  if value == "L" then
    return "Message Type: System Text Message (L)"
  end
  if value == "M" then
    return "Message Type: Open Interest Message (M)"
  end
  if value == "N" then
    return "Message Type: Open Price Message (N)"
  end
  if value == "c" then
    return "Message Type: Close Price Message (c)"
  end
  if value == "O" then
    return "Message Type: Settlement Price Message (O)"
  end
  if value == "z" then
    return "Message Type: Index Prices Message (z)"
  end
  if value == "u" then
    return "Message Type: End of Day Market Summary Message (u)"
  end
  if value == "f" then
    return "Message Type: Market Event Message (f)"
  end
  if value == "g" then
    return "Message Type: Pre Open Price Indicator Message (g)"
  end
  if value == "i" then
    return "Message Type: Strip Info Message (i)"
  end
  if value == "V" then
    return "Message Type: Interval Price Limit Notification Message (V)"
  end
  if value == "9" then
    return "Message Type: New Futures Strategy Definition Message (9)"
  end
  if value == "R" then
    return "Message Type: New Expiry Message (R)"
  end
  if value == "b" then
    return "Message Type: Special Field Message (b)"
  end
  if value == "D" then
    return "Message Type: Market Snapshot Order Message (D)"
  end
  if value == "E" then
    return "Message Type: Add or Modify Order Message (E)"
  end
  if value == "F" then
    return "Message Type: Delete Order Message (F)"
  end
  if value == "T" then
    return "Message Type: Message Bundle Marker (T)"
  end
  if value == "3" then
    return "Message Type: Fixing Transition Message (3)"
  end
  if value == "4" then
    return "Message Type: Fixing Lockdown Message (4)"
  end
  if value == "0" then
    return "Message Type: Fixing Indicative Price Message  Message (0)"
  end
  if value == "m" then
    return "Message Type: Market Snapshot Price Level Message (m)"
  end
  if value == "t" then
    return "Message Type: Add Price Level Message (t)"
  end
  if value == "s" then
    return "Message Type: Change Price Level Message (s)"
  end
  if value == "r" then
    return "Message Type: Delete Price Level Message (r)"
  end
  if value == "U" then
    return "Message Type: New Options Strategy Definition Message (U)"
  end
  if value == "l" then
    return "Message Type: New Options Market Definition Message (l)"
  end
  if value == "k" then
    return "Message Type: RFQ Message (k)"
  end
  if value == "v" then
    return "Message Type: Option Open Interest Message (v)"
  end
  if value == "w" then
    return "Message Type: Option Settlement Price Message (w)"
  end
  if value == "W" then
    return "Message Type: Old Style Options Trade and Market Stats Message (W)"
  end

  return "Message Type: Unknown("..value..")"
end

-- Dissect: Message Type
dissect.message_type = function(buffer, offset, packet, parent)
  local length = 1
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.message_type(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.message_type, range, value, display)

  return offset + length, value
end

-- Display: Message Header
display.message_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message Header
dissect.message_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Type: 1 Byte Ascii String Enum with 38 values
  index = dissect.message_type(buffer, index, packet, parent)

  -- Length: 2 Byte Unsigned Fixed Width Integer
  index = dissect.length(buffer, index, packet, parent)

  return index
end

-- Dissect: Message Header
dissect.message_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.message_header then
    local range = buffer(offset, 3)
    local display = display.message_header(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.message_header, range, display)
  end

  return dissect.message_header_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size: Message
size_of.message = function(buffer, offset)
  local index = 0

  index = index + 3

  -- Calculate runtime size of Payload field
  local payload_offset = offset + index
  local payload_type = buffer(payload_offset - 3, 1):string()
  index = index + size_of.payload(buffer, payload_offset, payload_type)

  return index
end

-- Display: Message
display.message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message
dissect.message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Header: Struct of 2 fields
  index = dissect.message_header(buffer, index, packet, parent)

  -- Payload: Runtime Type with 38 branches
  local code = buffer(index - 3, 1):string()
  index = dissect.payload(buffer, index, packet, parent, code)

  return index
end

-- Dissect: Message
dissect.message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.message then
    local length = size_of.message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.message(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.message, range, display)
  end

  return dissect.message_fields(buffer, offset, packet, parent)
end

-- Size: Count
size_of.count = 2

-- Display: Count
display.count = function(value)
  return "Count: "..value
end

-- Dissect: Count
dissect.count = function(buffer, offset, packet, parent)
  local length = 2
  local range = buffer(offset, length)
  local value = range:uint()
  local display = display.count(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.count, range, value, display)

  return offset + length, value
end

-- Size: Sequence
size_of.sequence = 4

-- Display: Sequence
display.sequence = function(value)
  return "Sequence: "..value
end

-- Dissect: Sequence
dissect.sequence = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.sequence)
  local value = range:uint()
  local display = display.sequence(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.sequence, range, value, display)

  return offset + size_of.sequence
end

-- Size: Session
size_of.session = 2

-- Display: Session
display.session = function(value)
  return "Session: "..value
end

-- Dissect: Session
dissect.session = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.session)
  local value = range:uint()
  local display = display.session(value, buffer, offset, packet, parent)

  parent:add(ice_mdf_impact_v1_1_33.fields.session, range, value, display)

  return offset + size_of.session
end

-- Display: Packet Header
display.packet_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Packet Header
dissect.packet_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Session: 2 Byte Unsigned Fixed Width Integer
  index = dissect.session(buffer, index, packet, parent)

  -- Sequence: 4 Byte Unsigned Fixed Width Integer
  index = dissect.sequence(buffer, index, packet, parent)

  -- Count: 2 Byte Unsigned Fixed Width Integer
  index = dissect.count(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Unsigned Fixed Width Integer
  index = dissect.timestamp(buffer, index, packet, parent)

  return index
end

-- Dissect: Packet Header
dissect.packet_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.packet_header then
    local range = buffer(offset, 16)
    local display = display.packet_header(buffer, packet, parent)
    parent = parent:add(ice_mdf_impact_v1_1_33.fields.packet_header, range, display)
  end

  return dissect.packet_header_fields(buffer, offset, packet, parent)
end

-- Dissect Packet
dissect.packet = function(buffer, packet, parent)
  local index = 0

  -- Packet Header: Struct of 4 fields
  index = dissect.packet_header(buffer, index, packet, parent)

  -- Message: Struct of 2 fields
  local message_count = buffer(index - 10, 2):uint()
  for i = 1, message_count do
    index = dissect.message(buffer, index, packet, parent)
  end

  return index
end


-----------------------------------------------------------------------
-- Protocol Dissector and Components
-----------------------------------------------------------------------

-- Initialize Dissector
function ice_mdf_impact_v1_1_33.init()
end

-- Dissector for Ice Mdf iMpact 1.1.33
function ice_mdf_impact_v1_1_33.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = ice_mdf_impact_v1_1_33.name

  -- Dissect protocol
  local protocol = parent:add(ice_mdf_impact_v1_1_33, buffer(), ice_mdf_impact_v1_1_33.description, "("..buffer:len().." Bytes)")
  local protocol_size = dissect.packet(buffer, packet, protocol)
end

-- Register With Udp Table
local udp_table = DissectorTable.get("udp.port")
udp_table:add(65333, ice_mdf_impact_v1_1_33)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.ice_mdf_impact_v1_1_33_packet_size = function(buffer)

  return true
end

-- Dissector Heuristic for Ice Mdf iMpact 1.1.33
local function ice_mdf_impact_v1_1_33_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.ice_mdf_impact_v1_1_33_packet_size(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = ice_mdf_impact_v1_1_33
  ice_mdf_impact_v1_1_33.dissector(buffer, packet, parent)

  return true
end

-- Register Ice Mdf iMpact 1.1.33 Heuristic
ice_mdf_impact_v1_1_33:register_heuristic("udp", ice_mdf_impact_v1_1_33_heuristic)

-----------------------------------------------------------------------
-- This script was generated by the open markets initiative
-- Lua dissectors are an easily edited and modified cross platform dissection solution.
-- Feel free to modify. Enjoy.
-----------------------------------------------------------------------
-- Protocol:
-- Version: 1.1.33
-- Date: Monday, August 6, 2018
-- Script:
-- Source Version: 1.5.0.0
-- Compiler Version: 1.1
-- License: Public/GPLv3
-- Authors: Omi Developers
-----------------------------------------------------------------------
