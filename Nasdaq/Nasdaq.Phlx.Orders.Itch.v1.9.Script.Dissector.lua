-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Nasdaq Phlx Orders Itch 1.9 Protocol
local nasdaq_phlx_orders_itch_v1_9 = Proto("Nasdaq.Phlx.Orders.Itch.v1.9.Lua", "Nasdaq Phlx Orders Itch 1.9")

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

-- Nasdaq Phlx Orders Itch 1.9 Fields
nasdaq_phlx_orders_itch_v1_9.fields.action = ProtoField.new("Action", "nasdaq.phlx.orders.itch.v1.9.action", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.all_or_none = ProtoField.new("All Or None", "nasdaq.phlx.orders.itch.v1.9.allornone", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.auction_id = ProtoField.new("Auction Id", "nasdaq.phlx.orders.itch.v1.9.auctionid", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.auction_notification_message = ProtoField.new("Auction Notification Message", "nasdaq.phlx.orders.itch.v1.9.auctionnotificationmessage", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.auction_side = ProtoField.new("Auction Side", "nasdaq.phlx.orders.itch.v1.9.auctionside", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.auction_type = ProtoField.new("Auction Type", "nasdaq.phlx.orders.itch.v1.9.auctiontype", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.complex_auction_notification_message = ProtoField.new("Complex Auction Notification Message", "nasdaq.phlx.orders.itch.v1.9.complexauctionnotificationmessage", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.complex_order_leg = ProtoField.new("Complex Order Leg", "nasdaq.phlx.orders.itch.v1.9.complexorderleg", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.complex_order_message = ProtoField.new("Complex Order Message", "nasdaq.phlx.orders.itch.v1.9.complexordermessage", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.complex_order_strategy_leg = ProtoField.new("Complex Order Strategy Leg", "nasdaq.phlx.orders.itch.v1.9.complexorderstrategyleg", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.complex_order_strategy_message = ProtoField.new("Complex Order Strategy Message", "nasdaq.phlx.orders.itch.v1.9.complexorderstrategymessage", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.complex_trading_action_message = ProtoField.new("Complex Trading Action Message", "nasdaq.phlx.orders.itch.v1.9.complextradingactionmessage", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.count = ProtoField.new("Count", "nasdaq.phlx.orders.itch.v1.9.count", ftypes.UINT16)
nasdaq_phlx_orders_itch_v1_9.fields.current_trading_state = ProtoField.new("Current Trading State", "nasdaq.phlx.orders.itch.v1.9.currenttradingstate", ftypes.UINT8)
nasdaq_phlx_orders_itch_v1_9.fields.customer_firm_indicator = ProtoField.new("Customer Firm Indicator", "nasdaq.phlx.orders.itch.v1.9.customerfirmindicator", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.day = ProtoField.new("Day", "nasdaq.phlx.orders.itch.v1.9.day", ftypes.UINT16, nil, base.DEC, "0x001F")
nasdaq_phlx_orders_itch_v1_9.fields.debit_or_credit = ProtoField.new("Debit Or Credit", "nasdaq.phlx.orders.itch.v1.9.debitorcredit", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.event_code = ProtoField.new("Event Code", "nasdaq.phlx.orders.itch.v1.9.eventcode", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.executable_order_volume = ProtoField.new("Executable Order Volume", "nasdaq.phlx.orders.itch.v1.9.executableordervolume", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.expiration_year_month_and_day = ProtoField.new("Expiration Year Month And Day", "nasdaq.phlx.orders.itch.v1.9.expirationyearmonthandday", ftypes.UINT16)
nasdaq_phlx_orders_itch_v1_9.fields.explicit_strike_price = ProtoField.new("Explicit Strike Price", "nasdaq.phlx.orders.itch.v1.9.explicitstrikeprice", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.imbalance_volume = ProtoField.new("Imbalance Volume", "nasdaq.phlx.orders.itch.v1.9.imbalancevolume", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.leg_open_close_indicator = ProtoField.new("Leg Open Close Indicator", "nasdaq.phlx.orders.itch.v1.9.legopencloseindicator", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.leg_ratio = ProtoField.new("Leg Ratio", "nasdaq.phlx.orders.itch.v1.9.legratio", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.length = ProtoField.new("Length", "nasdaq.phlx.orders.itch.v1.9.length", ftypes.UINT16)
nasdaq_phlx_orders_itch_v1_9.fields.limit_price = ProtoField.new("Limit Price", "nasdaq.phlx.orders.itch.v1.9.limitprice", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.market_qualifier = ProtoField.new("Market Qualifier", "nasdaq.phlx.orders.itch.v1.9.marketqualifier", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.matched_volume = ProtoField.new("Matched Volume", "nasdaq.phlx.orders.itch.v1.9.matchedvolume", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.message = ProtoField.new("Message", "nasdaq.phlx.orders.itch.v1.9.message", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.message_header = ProtoField.new("Message Header", "nasdaq.phlx.orders.itch.v1.9.messageheader", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.message_type = ProtoField.new("Message Type", "nasdaq.phlx.orders.itch.v1.9.messagetype", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.month = ProtoField.new("Month", "nasdaq.phlx.orders.itch.v1.9.month", ftypes.UINT16, nil, base.DEC, "0x01E0")
nasdaq_phlx_orders_itch_v1_9.fields.nanoseconds = ProtoField.new("Nanoseconds", "nasdaq.phlx.orders.itch.v1.9.nanoseconds", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.number_of_legs = ProtoField.new("Number Of Legs", "nasdaq.phlx.orders.itch.v1.9.numberoflegs", ftypes.UINT8)
nasdaq_phlx_orders_itch_v1_9.fields.open_close_indicator = ProtoField.new("Open Close Indicator", "nasdaq.phlx.orders.itch.v1.9.opencloseindicator", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.open_state = ProtoField.new("Open State", "nasdaq.phlx.orders.itch.v1.9.openstate", ftypes.UINT8)
nasdaq_phlx_orders_itch_v1_9.fields.option_closing_type = ProtoField.new("Option Closing Type", "nasdaq.phlx.orders.itch.v1.9.optionclosingtype", ftypes.UINT8)
nasdaq_phlx_orders_itch_v1_9.fields.option_id = ProtoField.new("Option Id", "nasdaq.phlx.orders.itch.v1.9.optionid", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.option_type = ProtoField.new("Option Type", "nasdaq.phlx.orders.itch.v1.9.optiontype", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.options_directory_message = ProtoField.new("Options Directory Message", "nasdaq.phlx.orders.itch.v1.9.optionsdirectorymessage", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.order_id = ProtoField.new("Order Id", "nasdaq.phlx.orders.itch.v1.9.orderid", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.order_status = ProtoField.new("Order Status", "nasdaq.phlx.orders.itch.v1.9.orderstatus", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.order_type = ProtoField.new("Order Type", "nasdaq.phlx.orders.itch.v1.9.ordertype", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.original_order_volume = ProtoField.new("Original Order Volume", "nasdaq.phlx.orders.itch.v1.9.originalordervolume", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.packet = ProtoField.new("Packet", "nasdaq.phlx.orders.itch.v1.9.packet", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.packet_header = ProtoField.new("Packet Header", "nasdaq.phlx.orders.itch.v1.9.packetheader", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.payload = ProtoField.new("Payload", "nasdaq.phlx.orders.itch.v1.9.payload", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.phlx_tradable = ProtoField.new("Phlx Tradable", "nasdaq.phlx.orders.itch.v1.9.phlxtradable", ftypes.UINT8)
nasdaq_phlx_orders_itch_v1_9.fields.price = ProtoField.new("Price", "nasdaq.phlx.orders.itch.v1.9.price", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.reserved = ProtoField.new("Reserved", "nasdaq.phlx.orders.itch.v1.9.reserved", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.seconds = ProtoField.new("Seconds", "nasdaq.phlx.orders.itch.v1.9.seconds", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.security_open_closed_message = ProtoField.new("Security Open Closed Message", "nasdaq.phlx.orders.itch.v1.9.securityopenclosedmessage", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.security_symbol = ProtoField.new("Security Symbol", "nasdaq.phlx.orders.itch.v1.9.securitysymbol", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.security_trading_action_message = ProtoField.new("Security Trading Action Message", "nasdaq.phlx.orders.itch.v1.9.securitytradingactionmessage", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.sequence = ProtoField.new("Sequence", "nasdaq.phlx.orders.itch.v1.9.sequence", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.session = ProtoField.new("Session", "nasdaq.phlx.orders.itch.v1.9.session", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.side = ProtoField.new("Side", "nasdaq.phlx.orders.itch.v1.9.side", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.simple_order_message = ProtoField.new("Simple Order Message", "nasdaq.phlx.orders.itch.v1.9.simpleordermessage", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.source = ProtoField.new("Source", "nasdaq.phlx.orders.itch.v1.9.source", ftypes.UINT8)
nasdaq_phlx_orders_itch_v1_9.fields.strategy_id = ProtoField.new("Strategy Id", "nasdaq.phlx.orders.itch.v1.9.strategyid", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.strategy_open_closed_message = ProtoField.new("Strategy Open Closed Message", "nasdaq.phlx.orders.itch.v1.9.strategyopenclosedmessage", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.system_event_message = ProtoField.new("System Event Message", "nasdaq.phlx.orders.itch.v1.9.systemeventmessage", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.time_in_force = ProtoField.new("Time In Force", "nasdaq.phlx.orders.itch.v1.9.timeinforce", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.underlying_symbol = ProtoField.new("Underlying Symbol", "nasdaq.phlx.orders.itch.v1.9.underlyingsymbol", ftypes.STRING)
nasdaq_phlx_orders_itch_v1_9.fields.version = ProtoField.new("Version", "nasdaq.phlx.orders.itch.v1.9.version", ftypes.UINT8)
nasdaq_phlx_orders_itch_v1_9.fields.volume = ProtoField.new("Volume", "nasdaq.phlx.orders.itch.v1.9.volume", ftypes.UINT32)
nasdaq_phlx_orders_itch_v1_9.fields.year = ProtoField.new("Year", "nasdaq.phlx.orders.itch.v1.9.year", ftypes.UINT16, nil, base.DEC, "0xFE00")

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Nasdaq Phlx Orders Itch 1.9 Element Dissection Options
show.auction_notification_message = true
show.complex_auction_notification_message = true
show.complex_order_leg = true
show.complex_order_message = true
show.complex_order_strategy_leg = true
show.complex_order_strategy_message = true
show.complex_trading_action_message = true
show.expiration_year_month_and_day = true
show.message = true
show.message_header = true
show.options_directory_message = true
show.packet = true
show.packet_header = true
show.security_open_closed_message = true
show.security_trading_action_message = true
show.simple_order_message = true
show.strategy_open_closed_message = true
show.system_event_message = true
show.payload = false

-- Register Nasdaq Phlx Orders Itch 1.9 Show Options
nasdaq_phlx_orders_itch_v1_9.prefs.show_auction_notification_message = Pref.bool("Show Auction Notification Message", show.auction_notification_message, "Parse and add Auction Notification Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_auction_notification_message = Pref.bool("Show Complex Auction Notification Message", show.complex_auction_notification_message, "Parse and add Complex Auction Notification Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_leg = Pref.bool("Show Complex Order Leg", show.complex_order_leg, "Parse and add Complex Order Leg to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_message = Pref.bool("Show Complex Order Message", show.complex_order_message, "Parse and add Complex Order Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_strategy_leg = Pref.bool("Show Complex Order Strategy Leg", show.complex_order_strategy_leg, "Parse and add Complex Order Strategy Leg to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_strategy_message = Pref.bool("Show Complex Order Strategy Message", show.complex_order_strategy_message, "Parse and add Complex Order Strategy Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_trading_action_message = Pref.bool("Show Complex Trading Action Message", show.complex_trading_action_message, "Parse and add Complex Trading Action Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_expiration_year_month_and_day = Pref.bool("Show Expiration Year Month And Day", show.expiration_year_month_and_day, "Parse and add Expiration Year Month And Day to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_message = Pref.bool("Show Message", show.message, "Parse and add Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_message_header = Pref.bool("Show Message Header", show.message_header, "Parse and add Message Header to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_options_directory_message = Pref.bool("Show Options Directory Message", show.options_directory_message, "Parse and add Options Directory Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_packet = Pref.bool("Show Packet", show.packet, "Parse and add Packet to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_packet_header = Pref.bool("Show Packet Header", show.packet_header, "Parse and add Packet Header to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_security_open_closed_message = Pref.bool("Show Security Open Closed Message", show.security_open_closed_message, "Parse and add Security Open Closed Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_security_trading_action_message = Pref.bool("Show Security Trading Action Message", show.security_trading_action_message, "Parse and add Security Trading Action Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_simple_order_message = Pref.bool("Show Simple Order Message", show.simple_order_message, "Parse and add Simple Order Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_strategy_open_closed_message = Pref.bool("Show Strategy Open Closed Message", show.strategy_open_closed_message, "Parse and add Strategy Open Closed Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_system_event_message = Pref.bool("Show System Event Message", show.system_event_message, "Parse and add System Event Message to protocol tree")
nasdaq_phlx_orders_itch_v1_9.prefs.show_payload = Pref.bool("Show Payload", show.payload, "Parse and add Payload to protocol tree")

-- Handle changed preferences
function nasdaq_phlx_orders_itch_v1_9.prefs_changed()
  local changed = false

  -- Check if show options have changed
  if show.auction_notification_message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_auction_notification_message then
    show.auction_notification_message = nasdaq_phlx_orders_itch_v1_9.prefs.show_auction_notification_message
    changed = true
  end
  if show.complex_auction_notification_message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_auction_notification_message then
    show.complex_auction_notification_message = nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_auction_notification_message
    changed = true
  end
  if show.complex_order_leg ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_leg then
    show.complex_order_leg = nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_leg
    changed = true
  end
  if show.complex_order_message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_message then
    show.complex_order_message = nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_message
    changed = true
  end
  if show.complex_order_strategy_leg ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_strategy_leg then
    show.complex_order_strategy_leg = nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_strategy_leg
    changed = true
  end
  if show.complex_order_strategy_message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_strategy_message then
    show.complex_order_strategy_message = nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_order_strategy_message
    changed = true
  end
  if show.complex_trading_action_message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_trading_action_message then
    show.complex_trading_action_message = nasdaq_phlx_orders_itch_v1_9.prefs.show_complex_trading_action_message
    changed = true
  end
  if show.expiration_year_month_and_day ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_expiration_year_month_and_day then
    show.expiration_year_month_and_day = nasdaq_phlx_orders_itch_v1_9.prefs.show_expiration_year_month_and_day
    changed = true
  end
  if show.message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_message then
    show.message = nasdaq_phlx_orders_itch_v1_9.prefs.show_message
    changed = true
  end
  if show.message_header ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_message_header then
    show.message_header = nasdaq_phlx_orders_itch_v1_9.prefs.show_message_header
    changed = true
  end
  if show.options_directory_message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_options_directory_message then
    show.options_directory_message = nasdaq_phlx_orders_itch_v1_9.prefs.show_options_directory_message
    changed = true
  end
  if show.packet ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_packet then
    show.packet = nasdaq_phlx_orders_itch_v1_9.prefs.show_packet
    changed = true
  end
  if show.packet_header ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_packet_header then
    show.packet_header = nasdaq_phlx_orders_itch_v1_9.prefs.show_packet_header
    changed = true
  end
  if show.security_open_closed_message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_security_open_closed_message then
    show.security_open_closed_message = nasdaq_phlx_orders_itch_v1_9.prefs.show_security_open_closed_message
    changed = true
  end
  if show.security_trading_action_message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_security_trading_action_message then
    show.security_trading_action_message = nasdaq_phlx_orders_itch_v1_9.prefs.show_security_trading_action_message
    changed = true
  end
  if show.simple_order_message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_simple_order_message then
    show.simple_order_message = nasdaq_phlx_orders_itch_v1_9.prefs.show_simple_order_message
    changed = true
  end
  if show.strategy_open_closed_message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_strategy_open_closed_message then
    show.strategy_open_closed_message = nasdaq_phlx_orders_itch_v1_9.prefs.show_strategy_open_closed_message
    changed = true
  end
  if show.system_event_message ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_system_event_message then
    show.system_event_message = nasdaq_phlx_orders_itch_v1_9.prefs.show_system_event_message
    changed = true
  end
  if show.payload ~= nasdaq_phlx_orders_itch_v1_9.prefs.show_payload then
    show.payload = nasdaq_phlx_orders_itch_v1_9.prefs.show_payload
    changed = true
  end

  -- Reload on changed preference
  if changed then
    reload()
  end
end


-----------------------------------------------------------------------
-- Dissect Nasdaq Phlx Orders Itch 1.9
-----------------------------------------------------------------------

-- Size: Volume
size_of.volume = 4

-- Display: Volume
display.volume = function(value)
  return "Volume: "..value
end

-- Dissect: Volume
dissect.volume = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.volume)
  local value = range:uint()
  local display = display.volume(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.volume, range, value, display)

  return offset + size_of.volume
end

-- Size: Debit Or Credit
size_of.debit_or_credit = 1

-- Display: Debit Or Credit
display.debit_or_credit = function(value)
  if value == "D" then
    return "Debit Or Credit: Net Debit (D)"
  end
  if value == "C" then
    return "Debit Or Credit: Net Credit (C)"
  end
  if value == " " then
    return "Debit Or Credit: Even Or Market Order (<whitespace>)"
  end
  if value == "*" then
    return "Debit Or Credit: Anonymous (*)"
  end

  return "Debit Or Credit: Unknown("..value..")"
end

-- Dissect: Debit Or Credit
dissect.debit_or_credit = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.debit_or_credit)
  local value = range:string()
  local display = display.debit_or_credit(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.debit_or_credit, range, value, display)

  return offset + size_of.debit_or_credit
end

-- Size: Auction Side
size_of.auction_side = 1

-- Display: Auction Side
display.auction_side = function(value)
  if value == "B" then
    return "Auction Side: Buy (B)"
  end
  if value == "S" then
    return "Auction Side: Sell (S)"
  end
  if value == "*" then
    return "Auction Side: Solicitation Auction (*)"
  end

  return "Auction Side: Unknown("..value..")"
end

-- Dissect: Auction Side
dissect.auction_side = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.auction_side)
  local value = range:string()
  local display = display.auction_side(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.auction_side, range, value, display)

  return offset + size_of.auction_side
end

-- Size: Price
size_of.price = 4

-- Display: Price
display.price = function(value)
  return "Price: "..value
end

-- Dissect: Price
dissect.price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.price)
  local value = range:uint()
  local display = display.price(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.price, range, value, display)

  return offset + size_of.price
end

-- Size: Auction Type
size_of.auction_type = 1

-- Display: Auction Type
display.auction_type = function(value)
  if value == "C" then
    return "Auction Type: Cola (C)"
  end
  if value == "O" then
    return "Auction Type: Opening (O)"
  end
  if value == "R" then
    return "Auction Type: Reopening (R)"
  end
  if value == "P" then
    return "Auction Type: Pixl (P)"
  end
  if value == "S" then
    return "Auction Type: Solicitation (S)"
  end
  if value == "I" then
    return "Auction Type: Order Exposure (I)"
  end

  return "Auction Type: Unknown("..value..")"
end

-- Dissect: Auction Type
dissect.auction_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.auction_type)
  local value = range:string()
  local display = display.auction_type(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.auction_type, range, value, display)

  return offset + size_of.auction_type
end

-- Size: Auction Id
size_of.auction_id = 4

-- Display: Auction Id
display.auction_id = function(value)
  return "Auction Id: "..value
end

-- Dissect: Auction Id
dissect.auction_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.auction_id)
  local value = range:uint()
  local display = display.auction_id(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.auction_id, range, value, display)

  return offset + size_of.auction_id
end

-- Size: Strategy Id
size_of.strategy_id = 4

-- Display: Strategy Id
display.strategy_id = function(value)
  return "Strategy Id: "..value
end

-- Dissect: Strategy Id
dissect.strategy_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.strategy_id)
  local value = range:uint()
  local display = display.strategy_id(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.strategy_id, range, value, display)

  return offset + size_of.strategy_id
end

-- Size: Nanoseconds
size_of.nanoseconds = 4

-- Display: Nanoseconds
display.nanoseconds = function(value)
  return "Nanoseconds: "..value
end

-- Dissect: Nanoseconds
dissect.nanoseconds = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.nanoseconds)
  local value = range:uint()
  local display = display.nanoseconds(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.nanoseconds, range, value, display)

  return offset + size_of.nanoseconds
end

-- Size: Seconds
size_of.seconds = 4

-- Display: Seconds
display.seconds = function(value)
  return "Seconds: "..value
end

-- Dissect: Seconds
dissect.seconds = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.seconds)
  local value = range:uint()
  local display = display.seconds(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.seconds, range, value, display)

  return offset + size_of.seconds
end

-- Display: Complex Auction Notification Message
display.complex_auction_notification_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Complex Auction Notification Message
dissect.complex_auction_notification_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Seconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seconds(buffer, index, packet, parent)

  -- Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.nanoseconds(buffer, index, packet, parent)

  -- Strategy Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Auction Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.auction_id(buffer, index, packet, parent)

  -- Auction Type: 1 Byte Ascii String Enum with 6 values
  index = dissect.auction_type(buffer, index, packet, parent)

  -- Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Auction Side: 1 Byte Ascii String Enum with 3 values
  index = dissect.auction_side(buffer, index, packet, parent)

  -- Debit Or Credit: 1 Byte Ascii String Enum with 4 values
  index = dissect.debit_or_credit(buffer, index, packet, parent)

  -- Volume: 4 Byte Unsigned Fixed Width Integer
  index = dissect.volume(buffer, index, packet, parent)

  return index
end

-- Dissect: Complex Auction Notification Message
dissect.complex_auction_notification_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.complex_auction_notification_message then
    local range = buffer(offset, 27)
    local display = display.complex_auction_notification_message(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.complex_auction_notification_message, range, display)
  end

  return dissect.complex_auction_notification_message_fields(buffer, offset, packet, parent)
end

-- Size: Reserved
size_of.reserved = 4

-- Display: Reserved
display.reserved = function(value)
  return "Reserved: "..value
end

-- Dissect: Reserved
dissect.reserved = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.reserved)
  local value = range:uint()
  local display = display.reserved(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.reserved, range, value, display)

  return offset + size_of.reserved
end

-- Size: Imbalance Volume
size_of.imbalance_volume = 4

-- Display: Imbalance Volume
display.imbalance_volume = function(value)
  return "Imbalance Volume: "..value
end

-- Dissect: Imbalance Volume
dissect.imbalance_volume = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.imbalance_volume)
  local value = range:uint()
  local display = display.imbalance_volume(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.imbalance_volume, range, value, display)

  return offset + size_of.imbalance_volume
end

-- Size: Matched Volume
size_of.matched_volume = 4

-- Display: Matched Volume
display.matched_volume = function(value)
  return "Matched Volume: "..value
end

-- Dissect: Matched Volume
dissect.matched_volume = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.matched_volume)
  local value = range:uint()
  local display = display.matched_volume(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.matched_volume, range, value, display)

  return offset + size_of.matched_volume
end

-- Size: Option Type
size_of.option_type = 1

-- Display: Option Type
display.option_type = function(value)
  if value == "C" then
    return "Option Type: Call (C)"
  end
  if value == "P" then
    return "Option Type: Put (P)"
  end
  if value == " " then
    return "Option Type: Stock (<whitespace>)"
  end

  return "Option Type: Unknown("..value..")"
end

-- Dissect: Option Type
dissect.option_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.option_type)
  local value = range:string()
  local display = display.option_type(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.option_type, range, value, display)

  return offset + size_of.option_type
end

-- Size: Explicit Strike Price
size_of.explicit_strike_price = 4

-- Display: Explicit Strike Price
display.explicit_strike_price = function(value)
  return "Explicit Strike Price: "..value
end

-- Dissect: Explicit Strike Price
dissect.explicit_strike_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.explicit_strike_price)
  local value = range:uint()
  local display = display.explicit_strike_price(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.explicit_strike_price, range, value, display)

  return offset + size_of.explicit_strike_price
end

-- Display: Expiration Year Month And Day
display.expiration_year_month_and_day = function(buffer, packet, parent)
  local display = ""


  return display:sub(1, -2)
end

-- Dissect Bit Fields: Expiration Year Month And Day
dissect.expiration_year_month_and_day_bits = function(buffer, offset, packet, parent)

  -- Year: 7 Bit
  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.year, buffer(offset, 2))

  -- Month: 4 Bit
  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.month, buffer(offset, 2))

  -- Day: 5 Bit
  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.day, buffer(offset, 2))
end

-- Dissect: Expiration Year Month And Day
dissect.expiration_year_month_and_day = function(buffer, offset, packet, parent)
  local size = 2
  local range = buffer(offset, size)
  local display = display.expiration_year_month_and_day(range, packet, parent)
  local element = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.expiration_year_month_and_day, range, display)

  if show.expiration_year_month_and_day then
    dissect.expiration_year_month_and_day_bits(buffer, offset, packet, element)
  end

  return offset + 2
end

-- Size: Security Symbol
size_of.security_symbol = 5

-- Display: Security Symbol
display.security_symbol = function(value)
  return "Security Symbol: "..value
end

-- Dissect: Security Symbol
dissect.security_symbol = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.security_symbol)
  local value = range:string()
  local display = display.security_symbol(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.security_symbol, range, value, display)

  return offset + size_of.security_symbol
end

-- Size: Option Id
size_of.option_id = 4

-- Display: Option Id
display.option_id = function(value)
  return "Option Id: "..value
end

-- Dissect: Option Id
dissect.option_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.option_id)
  local value = range:uint()
  local display = display.option_id(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.option_id, range, value, display)

  return offset + size_of.option_id
end

-- Display: Auction Notification Message
display.auction_notification_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Auction Notification Message
dissect.auction_notification_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Seconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seconds(buffer, index, packet, parent)

  -- Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.nanoseconds(buffer, index, packet, parent)

  -- Option Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.option_id(buffer, index, packet, parent)

  -- Security Symbol: 5 Byte Ascii String
  index = dissect.security_symbol(buffer, index, packet, parent)

  -- Expiration Year Month And Day: 2 Byte Unsigned Fixed Width Integer: Struct of 3 fields
  index = dissect.expiration_year_month_and_day(buffer, index, packet, parent)

  -- Explicit Strike Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.explicit_strike_price(buffer, index, packet, parent)

  -- Option Type: 1 Byte Ascii String Enum with 3 values
  index = dissect.option_type(buffer, index, packet, parent)

  -- Auction Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.auction_id(buffer, index, packet, parent)

  -- Auction Type: 1 Byte Ascii String Enum with 6 values
  index = dissect.auction_type(buffer, index, packet, parent)

  -- Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.price(buffer, index, packet, parent)

  -- Auction Side: 1 Byte Ascii String Enum with 3 values
  index = dissect.auction_side(buffer, index, packet, parent)

  -- Matched Volume: 4 Byte Unsigned Fixed Width Integer
  index = dissect.matched_volume(buffer, index, packet, parent)

  -- Imbalance Volume: 4 Byte Unsigned Fixed Width Integer
  index = dissect.imbalance_volume(buffer, index, packet, parent)

  -- Reserved: 4 Byte Unsigned Fixed Width Integer
  index = dissect.reserved(buffer, index, packet, parent)

  return index
end

-- Dissect: Auction Notification Message
dissect.auction_notification_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.auction_notification_message then
    local range = buffer(offset, 46)
    local display = display.auction_notification_message(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.auction_notification_message, range, display)
  end

  return dissect.auction_notification_message_fields(buffer, offset, packet, parent)
end

-- Size: Leg Ratio
size_of.leg_ratio = 4

-- Display: Leg Ratio
display.leg_ratio = function(value)
  return "Leg Ratio: "..value
end

-- Dissect: Leg Ratio
dissect.leg_ratio = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_ratio)
  local value = range:uint()
  local display = display.leg_ratio(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.leg_ratio, range, value, display)

  return offset + size_of.leg_ratio
end

-- Size: Side
size_of.side = 1

-- Display: Side
display.side = function(value)
  if value == "B" then
    return "Side: Buy (B)"
  end
  if value == "S" then
    return "Side: Sell (S)"
  end
  if value == "*" then
    return "Side: Hidden (*)"
  end

  return "Side: Unknown("..value..")"
end

-- Dissect: Side
dissect.side = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.side)
  local value = range:string()
  local display = display.side(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.side, range, value, display)

  return offset + size_of.side
end

-- Size: Leg Open Close Indicator
size_of.leg_open_close_indicator = 1

-- Display: Leg Open Close Indicator
display.leg_open_close_indicator = function(value)
  if value == "O" then
    return "Leg Open Close Indicator: Opens Position (O)"
  end
  if value == "C" then
    return "Leg Open Close Indicator: Closes Position (C)"
  end
  if value == " " then
    return "Leg Open Close Indicator: Stock Leg (<whitespace>)"
  end

  return "Leg Open Close Indicator: Unknown("..value..")"
end

-- Dissect: Leg Open Close Indicator
dissect.leg_open_close_indicator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.leg_open_close_indicator)
  local value = range:string()
  local display = display.leg_open_close_indicator(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.leg_open_close_indicator, range, value, display)

  return offset + size_of.leg_open_close_indicator
end

-- Display: Complex Order Leg
display.complex_order_leg = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Complex Order Leg
dissect.complex_order_leg_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Leg Open Close Indicator: 1 Byte Ascii String Enum with 3 values
  index = dissect.leg_open_close_indicator(buffer, index, packet, parent)

  -- Option Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.option_id(buffer, index, packet, parent)

  -- Security Symbol: 5 Byte Ascii String
  index = dissect.security_symbol(buffer, index, packet, parent)

  -- Expiration Year Month And Day: 2 Byte Unsigned Fixed Width Integer: Struct of 3 fields
  index = dissect.expiration_year_month_and_day(buffer, index, packet, parent)

  -- Explicit Strike Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.explicit_strike_price(buffer, index, packet, parent)

  -- Option Type: 1 Byte Ascii String Enum with 3 values
  index = dissect.option_type(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 3 values
  index = dissect.side(buffer, index, packet, parent)

  -- Leg Ratio: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio(buffer, index, packet, parent)

  return index
end

-- Dissect: Complex Order Leg
dissect.complex_order_leg = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.complex_order_leg then
    local range = buffer(offset, 22)
    local display = display.complex_order_leg(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.complex_order_leg, range, display)
  end

  return dissect.complex_order_leg_fields(buffer, offset, packet, parent)
end

-- Size: Number Of Legs
size_of.number_of_legs = 1

-- Display: Number Of Legs
display.number_of_legs = function(value)
  return "Number Of Legs: "..value
end

-- Dissect: Number Of Legs
dissect.number_of_legs = function(buffer, offset, packet, parent)
  local length = 1
  local range = buffer(offset, length)
  local value = range:uint()
  local display = display.number_of_legs(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.number_of_legs, range, value, display)

  return offset + length, value
end

-- Size: Underlying Symbol
size_of.underlying_symbol = 13

-- Display: Underlying Symbol
display.underlying_symbol = function(value)
  return "Underlying Symbol: "..value
end

-- Dissect: Underlying Symbol
dissect.underlying_symbol = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.underlying_symbol)
  local value = range:string()
  local display = display.underlying_symbol(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.underlying_symbol, range, value, display)

  return offset + size_of.underlying_symbol
end

-- Size: Customer Firm Indicator
size_of.customer_firm_indicator = 1

-- Display: Customer Firm Indicator
display.customer_firm_indicator = function(value)
  if value == "C" then
    return "Customer Firm Indicator: Customer Order (C)"
  end
  if value == "F" then
    return "Customer Firm Indicator: Firm Order (F)"
  end
  if value == "M" then
    return "Customer Firm Indicator: Onfloor Market Maker (M)"
  end
  if value == "B" then
    return "Customer Firm Indicator: Broker Dealer Order (B)"
  end
  if value == "P" then
    return "Customer Firm Indicator: Professional Order (P)"
  end
  if value == " " then
    return "Customer Firm Indicator: Na For Implied Order (<whitespace>)"
  end

  return "Customer Firm Indicator: Unknown("..value..")"
end

-- Dissect: Customer Firm Indicator
dissect.customer_firm_indicator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.customer_firm_indicator)
  local value = range:string()
  local display = display.customer_firm_indicator(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.customer_firm_indicator, range, value, display)

  return offset + size_of.customer_firm_indicator
end

-- Size: Time In Force
size_of.time_in_force = 1

-- Display: Time In Force
display.time_in_force = function(value)
  if value == "D" then
    return "Time In Force: Day Order (D)"
  end
  if value == "G" then
    return "Time In Force: Gtc (G)"
  end
  if value == "I" then
    return "Time In Force: Ioc (I)"
  end

  return "Time In Force: Unknown("..value..")"
end

-- Dissect: Time In Force
dissect.time_in_force = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.time_in_force)
  local value = range:string()
  local display = display.time_in_force(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.time_in_force, range, value, display)

  return offset + size_of.time_in_force
end

-- Size: All Or None
size_of.all_or_none = 1

-- Display: All Or None
display.all_or_none = function(value)
  if value == "Y" then
    return "All Or None: All Or None Order (Y)"
  end
  if value == "N" then
    return "All Or None: Not All Or None Order (N)"
  end

  return "All Or None: Unknown("..value..")"
end

-- Dissect: All Or None
dissect.all_or_none = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.all_or_none)
  local value = range:string()
  local display = display.all_or_none(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.all_or_none, range, value, display)

  return offset + size_of.all_or_none
end

-- Size: Limit Price
size_of.limit_price = 4

-- Display: Limit Price
display.limit_price = function(value)
  return "Limit Price: "..value
end

-- Dissect: Limit Price
dissect.limit_price = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.limit_price)
  local value = range:uint()
  local display = display.limit_price(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.limit_price, range, value, display)

  return offset + size_of.limit_price
end

-- Size: Order Type
size_of.order_type = 1

-- Display: Order Type
display.order_type = function(value)
  if value == "M" then
    return "Order Type: Market (M)"
  end
  if value == "L" then
    return "Order Type: Limit (L)"
  end
  if value == "*" then
    return "Order Type: Anonymous (*)"
  end

  return "Order Type: Unknown("..value..")"
end

-- Dissect: Order Type
dissect.order_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.order_type)
  local value = range:string()
  local display = display.order_type(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.order_type, range, value, display)

  return offset + size_of.order_type
end

-- Size: Order Status
size_of.order_status = 1

-- Display: Order Status
display.order_status = function(value)
  if value == "O" then
    return "Order Status: Open (O)"
  end
  if value == "F" then
    return "Order Status: Filled (F)"
  end
  if value == "C" then
    return "Order Status: Cancelled (C)"
  end
  if value == "R" then
    return "Order Status: Renotification (R)"
  end

  return "Order Status: Unknown("..value..")"
end

-- Dissect: Order Status
dissect.order_status = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.order_status)
  local value = range:string()
  local display = display.order_status(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.order_status, range, value, display)

  return offset + size_of.order_status
end

-- Size: Executable Order Volume
size_of.executable_order_volume = 4

-- Display: Executable Order Volume
display.executable_order_volume = function(value)
  return "Executable Order Volume: "..value
end

-- Dissect: Executable Order Volume
dissect.executable_order_volume = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.executable_order_volume)
  local value = range:uint()
  local display = display.executable_order_volume(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.executable_order_volume, range, value, display)

  return offset + size_of.executable_order_volume
end

-- Size: Original Order Volume
size_of.original_order_volume = 4

-- Display: Original Order Volume
display.original_order_volume = function(value)
  return "Original Order Volume: "..value
end

-- Dissect: Original Order Volume
dissect.original_order_volume = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.original_order_volume)
  local value = range:uint()
  local display = display.original_order_volume(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.original_order_volume, range, value, display)

  return offset + size_of.original_order_volume
end

-- Size: Order Id
size_of.order_id = 4

-- Display: Order Id
display.order_id = function(value)
  return "Order Id: "..value
end

-- Dissect: Order Id
dissect.order_id = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.order_id)
  local value = range:uint()
  local display = display.order_id(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.order_id, range, value, display)

  return offset + size_of.order_id
end

-- Calculate runtime size: Complex Order Message
size_of.complex_order_message = function(buffer, offset)
  local index = 0

  index = index + 49

  -- Calculate field size from count
  local complex_order_leg_count = buffer(offset + index - 1, 1):uint()
  index = index + complex_order_leg_count * 22

  return index
end

-- Display: Complex Order Message
display.complex_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Complex Order Message
dissect.complex_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Seconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seconds(buffer, index, packet, parent)

  -- Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.nanoseconds(buffer, index, packet, parent)

  -- Strategy Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Order Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.order_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 3 values
  index = dissect.side(buffer, index, packet, parent)

  -- Original Order Volume: 4 Byte Unsigned Fixed Width Integer
  index = dissect.original_order_volume(buffer, index, packet, parent)

  -- Executable Order Volume: 4 Byte Unsigned Fixed Width Integer
  index = dissect.executable_order_volume(buffer, index, packet, parent)

  -- Order Status: 1 Byte Ascii String Enum with 4 values
  index = dissect.order_status(buffer, index, packet, parent)

  -- Order Type: 1 Byte Ascii String Enum with 3 values
  index = dissect.order_type(buffer, index, packet, parent)

  -- Limit Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.limit_price(buffer, index, packet, parent)

  -- Debit Or Credit: 1 Byte Ascii String Enum with 4 values
  index = dissect.debit_or_credit(buffer, index, packet, parent)

  -- All Or None: 1 Byte Ascii String Enum with 2 values
  index = dissect.all_or_none(buffer, index, packet, parent)

  -- Time In Force: 1 Byte Ascii String Enum with 3 values
  index = dissect.time_in_force(buffer, index, packet, parent)

  -- Customer Firm Indicator: 1 Byte Ascii String Enum with 6 values
  index = dissect.customer_firm_indicator(buffer, index, packet, parent)

  -- Underlying Symbol: 13 Byte Ascii String
  index = dissect.underlying_symbol(buffer, index, packet, parent)

  -- Number Of Legs: 1 Byte Unsigned Fixed Width Integer
  index = dissect.number_of_legs(buffer, index, packet, parent)

  -- Complex Order Leg: Struct of 8 fields
  local complex_order_leg_count = buffer(index - 1, 1):uint()
  for i = 1, complex_order_leg_count do
    index = dissect.complex_order_leg(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Complex Order Message
dissect.complex_order_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.complex_order_message then
    local length = size_of.complex_order_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.complex_order_message(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.complex_order_message, range, display)
  end

  return dissect.complex_order_message_fields(buffer, offset, packet, parent)
end

-- Size: Open Close Indicator
size_of.open_close_indicator = 1

-- Display: Open Close Indicator
display.open_close_indicator = function(value)
  if value == "O" then
    return "Open Close Indicator: Opens Position (O)"
  end
  if value == "C" then
    return "Open Close Indicator: Closes Position (C)"
  end
  if value == " " then
    return "Open Close Indicator: Na (<whitespace>)"
  end

  return "Open Close Indicator: Unknown("..value..")"
end

-- Dissect: Open Close Indicator
dissect.open_close_indicator = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.open_close_indicator)
  local value = range:string()
  local display = display.open_close_indicator(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.open_close_indicator, range, value, display)

  return offset + size_of.open_close_indicator
end

-- Size: Market Qualifier
size_of.market_qualifier = 1

-- Display: Market Qualifier
display.market_qualifier = function(value)
  if value == "O" then
    return "Market Qualifier: Opening Order (O)"
  end
  if value == "I" then
    return "Market Qualifier: Implied Order (I)"
  end
  if value == " " then
    return "Market Qualifier: Na (<whitespace>)"
  end

  return "Market Qualifier: Unknown("..value..")"
end

-- Dissect: Market Qualifier
dissect.market_qualifier = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.market_qualifier)
  local value = range:string()
  local display = display.market_qualifier(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.market_qualifier, range, value, display)

  return offset + size_of.market_qualifier
end

-- Display: Simple Order Message
display.simple_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Simple Order Message
dissect.simple_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Seconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seconds(buffer, index, packet, parent)

  -- Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.nanoseconds(buffer, index, packet, parent)

  -- Option Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.option_id(buffer, index, packet, parent)

  -- Security Symbol: 5 Byte Ascii String
  index = dissect.security_symbol(buffer, index, packet, parent)

  -- Expiration Year Month And Day: 2 Byte Unsigned Fixed Width Integer: Struct of 3 fields
  index = dissect.expiration_year_month_and_day(buffer, index, packet, parent)

  -- Explicit Strike Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.explicit_strike_price(buffer, index, packet, parent)

  -- Option Type: 1 Byte Ascii String Enum with 3 values
  index = dissect.option_type(buffer, index, packet, parent)

  -- Order Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.order_id(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 3 values
  index = dissect.side(buffer, index, packet, parent)

  -- Original Order Volume: 4 Byte Unsigned Fixed Width Integer
  index = dissect.original_order_volume(buffer, index, packet, parent)

  -- Executable Order Volume: 4 Byte Unsigned Fixed Width Integer
  index = dissect.executable_order_volume(buffer, index, packet, parent)

  -- Order Status: 1 Byte Ascii String Enum with 4 values
  index = dissect.order_status(buffer, index, packet, parent)

  -- Order Type: 1 Byte Ascii String Enum with 3 values
  index = dissect.order_type(buffer, index, packet, parent)

  -- Market Qualifier: 1 Byte Ascii String Enum with 3 values
  index = dissect.market_qualifier(buffer, index, packet, parent)

  -- Limit Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.limit_price(buffer, index, packet, parent)

  -- All Or None: 1 Byte Ascii String Enum with 2 values
  index = dissect.all_or_none(buffer, index, packet, parent)

  -- Time In Force: 1 Byte Ascii String Enum with 3 values
  index = dissect.time_in_force(buffer, index, packet, parent)

  -- Customer Firm Indicator: 1 Byte Ascii String Enum with 6 values
  index = dissect.customer_firm_indicator(buffer, index, packet, parent)

  -- Open Close Indicator: 1 Byte Ascii String Enum with 3 values
  index = dissect.open_close_indicator(buffer, index, packet, parent)

  return index
end

-- Dissect: Simple Order Message
dissect.simple_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.simple_order_message then
    local range = buffer(offset, 48)
    local display = display.simple_order_message(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.simple_order_message, range, display)
  end

  return dissect.simple_order_message_fields(buffer, offset, packet, parent)
end

-- Size: Open State
size_of.open_state = 1

-- Display: Open State
display.open_state = function(value)
  if value == Y then
    return "Open State: Open For Auto Execution (Y)"
  end
  if value == N then
    return "Open State: Closed For Auto Execution (N)"
  end

  return "Open State: Unknown("..value..")"
end

-- Dissect: Open State
dissect.open_state = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.open_state)
  local value = range:uint()
  local display = display.open_state(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.open_state, range, value, display)

  return offset + size_of.open_state
end

-- Display: Strategy Open Closed Message
display.strategy_open_closed_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Strategy Open Closed Message
dissect.strategy_open_closed_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Seconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seconds(buffer, index, packet, parent)

  -- Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.nanoseconds(buffer, index, packet, parent)

  -- Strategy Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Open State: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index = dissect.open_state(buffer, index, packet, parent)

  return index
end

-- Dissect: Strategy Open Closed Message
dissect.strategy_open_closed_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.strategy_open_closed_message then
    local range = buffer(offset, 13)
    local display = display.strategy_open_closed_message(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.strategy_open_closed_message, range, display)
  end

  return dissect.strategy_open_closed_message_fields(buffer, offset, packet, parent)
end

-- Display: Security Open Closed Message
display.security_open_closed_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Security Open Closed Message
dissect.security_open_closed_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Seconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seconds(buffer, index, packet, parent)

  -- Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.nanoseconds(buffer, index, packet, parent)

  -- Option Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.option_id(buffer, index, packet, parent)

  -- Security Symbol: 5 Byte Ascii String
  index = dissect.security_symbol(buffer, index, packet, parent)

  -- Expiration Year Month And Day: 2 Byte Unsigned Fixed Width Integer: Struct of 3 fields
  index = dissect.expiration_year_month_and_day(buffer, index, packet, parent)

  -- Explicit Strike Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.explicit_strike_price(buffer, index, packet, parent)

  -- Option Type: 1 Byte Ascii String Enum with 3 values
  index = dissect.option_type(buffer, index, packet, parent)

  -- Open State: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index = dissect.open_state(buffer, index, packet, parent)

  return index
end

-- Dissect: Security Open Closed Message
dissect.security_open_closed_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.security_open_closed_message then
    local range = buffer(offset, 25)
    local display = display.security_open_closed_message(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.security_open_closed_message, range, display)
  end

  return dissect.security_open_closed_message_fields(buffer, offset, packet, parent)
end

-- Size: Current Trading State
size_of.current_trading_state = 1

-- Display: Current Trading State
display.current_trading_state = function(value)
  if value == H then
    return "Current Trading State: Halt In Effect (H)"
  end
  if value == T then
    return "Current Trading State: Phlx Trading Resumed (T)"
  end

  return "Current Trading State: Unknown("..value..")"
end

-- Dissect: Current Trading State
dissect.current_trading_state = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.current_trading_state)
  local value = range:uint()
  local display = display.current_trading_state(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.current_trading_state, range, value, display)

  return offset + size_of.current_trading_state
end

-- Display: Complex Trading Action Message
display.complex_trading_action_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Complex Trading Action Message
dissect.complex_trading_action_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Seconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seconds(buffer, index, packet, parent)

  -- Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.nanoseconds(buffer, index, packet, parent)

  -- Strategy Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Current Trading State: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index = dissect.current_trading_state(buffer, index, packet, parent)

  return index
end

-- Dissect: Complex Trading Action Message
dissect.complex_trading_action_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.complex_trading_action_message then
    local range = buffer(offset, 13)
    local display = display.complex_trading_action_message(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.complex_trading_action_message, range, display)
  end

  return dissect.complex_trading_action_message_fields(buffer, offset, packet, parent)
end

-- Display: Security Trading Action Message
display.security_trading_action_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Security Trading Action Message
dissect.security_trading_action_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Seconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seconds(buffer, index, packet, parent)

  -- Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.nanoseconds(buffer, index, packet, parent)

  -- Option Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.option_id(buffer, index, packet, parent)

  -- Security Symbol: 5 Byte Ascii String
  index = dissect.security_symbol(buffer, index, packet, parent)

  -- Expiration Year Month And Day: 2 Byte Unsigned Fixed Width Integer: Struct of 3 fields
  index = dissect.expiration_year_month_and_day(buffer, index, packet, parent)

  -- Explicit Strike Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.explicit_strike_price(buffer, index, packet, parent)

  -- Option Type: 1 Byte Ascii String Enum with 3 values
  index = dissect.option_type(buffer, index, packet, parent)

  -- Current Trading State: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index = dissect.current_trading_state(buffer, index, packet, parent)

  return index
end

-- Dissect: Security Trading Action Message
dissect.security_trading_action_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.security_trading_action_message then
    local range = buffer(offset, 25)
    local display = display.security_trading_action_message(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.security_trading_action_message, range, display)
  end

  return dissect.security_trading_action_message_fields(buffer, offset, packet, parent)
end

-- Display: Complex Order Strategy Leg
display.complex_order_strategy_leg = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Complex Order Strategy Leg
dissect.complex_order_strategy_leg_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Option Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.option_id(buffer, index, packet, parent)

  -- Security Symbol: 5 Byte Ascii String
  index = dissect.security_symbol(buffer, index, packet, parent)

  -- Expiration Year Month And Day: 2 Byte Unsigned Fixed Width Integer: Struct of 3 fields
  index = dissect.expiration_year_month_and_day(buffer, index, packet, parent)

  -- Explicit Strike Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.explicit_strike_price(buffer, index, packet, parent)

  -- Option Type: 1 Byte Ascii String Enum with 3 values
  index = dissect.option_type(buffer, index, packet, parent)

  -- Side: 1 Byte Ascii String Enum with 3 values
  index = dissect.side(buffer, index, packet, parent)

  -- Leg Ratio: 4 Byte Unsigned Fixed Width Integer
  index = dissect.leg_ratio(buffer, index, packet, parent)

  return index
end

-- Dissect: Complex Order Strategy Leg
dissect.complex_order_strategy_leg = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.complex_order_strategy_leg then
    local range = buffer(offset, 21)
    local display = display.complex_order_strategy_leg(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.complex_order_strategy_leg, range, display)
  end

  return dissect.complex_order_strategy_leg_fields(buffer, offset, packet, parent)
end

-- Size: Action
size_of.action = 1

-- Display: Action
display.action = function(value)
  if value == "A" then
    return "Action: Add (A)"
  end
  if value == "D" then
    return "Action: Delete (D)"
  end

  return "Action: Unknown("..value..")"
end

-- Dissect: Action
dissect.action = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.action)
  local value = range:string()
  local display = display.action(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.action, range, value, display)

  return offset + size_of.action
end

-- Size: Source
size_of.source = 1

-- Display: Source
display.source = function(value)
  return "Source: "..value
end

-- Dissect: Source
dissect.source = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.source)
  local value = range:uint()
  local display = display.source(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.source, range, value, display)

  return offset + size_of.source
end

-- Calculate runtime size: Complex Order Strategy Message
size_of.complex_order_strategy_message = function(buffer, offset)
  local index = 0

  index = index + 28

  -- Calculate field size from count
  local complex_order_strategy_leg_count = buffer(offset + index - 1, 1):uint()
  index = index + complex_order_strategy_leg_count * 21

  return index
end

-- Display: Complex Order Strategy Message
display.complex_order_strategy_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Complex Order Strategy Message
dissect.complex_order_strategy_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Seconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seconds(buffer, index, packet, parent)

  -- Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.nanoseconds(buffer, index, packet, parent)

  -- Strategy Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.strategy_id(buffer, index, packet, parent)

  -- Source: 1 Byte Unsigned Fixed Width Integer
  index = dissect.source(buffer, index, packet, parent)

  -- Underlying Symbol: 13 Byte Ascii String
  index = dissect.underlying_symbol(buffer, index, packet, parent)

  -- Action: 1 Byte Ascii String Enum with 2 values
  index = dissect.action(buffer, index, packet, parent)

  -- Number Of Legs: 1 Byte Unsigned Fixed Width Integer
  index = dissect.number_of_legs(buffer, index, packet, parent)

  -- Complex Order Strategy Leg: Struct of 7 fields
  local complex_order_strategy_leg_count = buffer(index - 1, 1):uint()
  for i = 1, complex_order_strategy_leg_count do
    index = dissect.complex_order_strategy_leg(buffer, index, packet, parent)
  end

  return index
end

-- Dissect: Complex Order Strategy Message
dissect.complex_order_strategy_message = function(buffer, offset, packet, parent)
  -- Optionally add dynamic struct element to protocol tree
  if show.complex_order_strategy_message then
    local length = size_of.complex_order_strategy_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.complex_order_strategy_message(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.complex_order_strategy_message, range, display)
  end

  return dissect.complex_order_strategy_message_fields(buffer, offset, packet, parent)
end

-- Size: Phlx Tradable
size_of.phlx_tradable = 1

-- Display: Phlx Tradable
display.phlx_tradable = function(value)
  if value == Y then
    return "Phlx Tradable: Tradable (Y)"
  end
  if value == N then
    return "Phlx Tradable: Not Tradable (N)"
  end

  return "Phlx Tradable: Unknown("..value..")"
end

-- Dissect: Phlx Tradable
dissect.phlx_tradable = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.phlx_tradable)
  local value = range:uint()
  local display = display.phlx_tradable(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.phlx_tradable, range, value, display)

  return offset + size_of.phlx_tradable
end

-- Size: Option Closing Type
size_of.option_closing_type = 1

-- Display: Option Closing Type
display.option_closing_type = function(value)
  if value == N then
    return "Option Closing Type: Normal (N)"
  end
  if value == L then
    return "Option Closing Type: Late (L)"
  end
  if value == W then
    return "Option Closing Type: Wco Early Closing (W)"
  end

  return "Option Closing Type: Unknown("..value..")"
end

-- Dissect: Option Closing Type
dissect.option_closing_type = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.option_closing_type)
  local value = range:uint()
  local display = display.option_closing_type(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.option_closing_type, range, value, display)

  return offset + size_of.option_closing_type
end

-- Display: Options Directory Message
display.options_directory_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Options Directory Message
dissect.options_directory_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Seconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seconds(buffer, index, packet, parent)

  -- Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.nanoseconds(buffer, index, packet, parent)

  -- Option Id: 4 Byte Unsigned Fixed Width Integer
  index = dissect.option_id(buffer, index, packet, parent)

  -- Security Symbol: 5 Byte Ascii String
  index = dissect.security_symbol(buffer, index, packet, parent)

  -- Expiration Year Month And Day: 2 Byte Unsigned Fixed Width Integer: Struct of 3 fields
  index = dissect.expiration_year_month_and_day(buffer, index, packet, parent)

  -- Explicit Strike Price: 4 Byte Unsigned Fixed Width Integer
  index = dissect.explicit_strike_price(buffer, index, packet, parent)

  -- Option Type: 1 Byte Ascii String Enum with 3 values
  index = dissect.option_type(buffer, index, packet, parent)

  -- Source: 1 Byte Unsigned Fixed Width Integer
  index = dissect.source(buffer, index, packet, parent)

  -- Underlying Symbol: 13 Byte Ascii String
  index = dissect.underlying_symbol(buffer, index, packet, parent)

  -- Option Closing Type: 1 Byte Unsigned Fixed Width Integer Enum with 3 values
  index = dissect.option_closing_type(buffer, index, packet, parent)

  -- Phlx Tradable: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index = dissect.phlx_tradable(buffer, index, packet, parent)

  return index
end

-- Dissect: Options Directory Message
dissect.options_directory_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.options_directory_message then
    local range = buffer(offset, 40)
    local display = display.options_directory_message(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.options_directory_message, range, display)
  end

  return dissect.options_directory_message_fields(buffer, offset, packet, parent)
end

-- Size: Version
size_of.version = 1

-- Display: Version
display.version = function(value)
  return "Version: "..value
end

-- Dissect: Version
dissect.version = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.version)
  local value = range:uint()
  local display = display.version(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.version, range, value, display)

  return offset + size_of.version
end

-- Size: Event Code
size_of.event_code = 1

-- Display: Event Code
display.event_code = function(value)
  if value == "O" then
    return "Event Code: Start Of Messages (O)"
  end
  if value == "S" then
    return "Event Code: Start Of System Hours (S)"
  end
  if value == "Q" then
    return "Event Code: Start Of Opening Process (Q)"
  end
  if value == "N" then
    return "Event Code: Start Of Normal Hours Closing Process (N)"
  end
  if value == "L" then
    return "Event Code: Start Of Late Hours Closing Process (L)"
  end
  if value == "E" then
    return "Event Code: End Of System Hours (E)"
  end
  if value == "C" then
    return "Event Code: End Of Messages (C)"
  end
  if value == "W" then
    return "Event Code: End Of Wco Early Closing (W)"
  end

  return "Event Code: Unknown("..value..")"
end

-- Dissect: Event Code
dissect.event_code = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.event_code)
  local value = range:string()
  local display = display.event_code(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.event_code, range, value, display)

  return offset + size_of.event_code
end

-- Display: System Event Message
display.system_event_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: System Event Message
dissect.system_event_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Seconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.seconds(buffer, index, packet, parent)

  -- Nanoseconds: 4 Byte Unsigned Fixed Width Integer
  index = dissect.nanoseconds(buffer, index, packet, parent)

  -- Event Code: 1 Byte Ascii String Enum with 8 values
  index = dissect.event_code(buffer, index, packet, parent)

  -- Version: 1 Byte Unsigned Fixed Width Integer
  index = dissect.version(buffer, index, packet, parent)

  return index
end

-- Dissect: System Event Message
dissect.system_event_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.system_event_message then
    local range = buffer(offset, 10)
    local display = display.system_event_message(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.system_event_message, range, display)
  end

  return dissect.system_event_message_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Payload
size_of.payload = function(buffer, offset, code)
  -- Size of System Event Message
  if code == "S" then
    return 10
  end
  -- Size of Options Directory Message
  if code == "D" then
    return 40
  end
  -- Size of Complex Order Strategy Message
  if code == "R" then
    return size_of.complex_order_strategy_message(buffer, offset)
  end
  -- Size of Security Trading Action Message
  if code == "H" then
    return 25
  end
  -- Size of Complex Trading Action Message
  if code == "I" then
    return 13
  end
  -- Size of Security Open Closed Message
  if code == "P" then
    return 25
  end
  -- Size of Strategy Open Closed Message
  if code == "Q" then
    return 13
  end
  -- Size of Simple Order Message
  if code == "O" then
    return 48
  end
  -- Size of Complex Order Message
  if code == "X" then
    return size_of.complex_order_message(buffer, offset)
  end
  -- Size of Auction Notification Message
  if code == "A" then
    return 46
  end
  -- Size of Complex Auction Notification Message
  if code == "C" then
    return 27
  end

  return 0
end

-- Display: Payload
display.payload = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches:
dissect.payload_branches = function(buffer, offset, packet, parent, code)
  -- Dissect System Event Message
  if code == "S" then
    return dissect.system_event_message(buffer, offset, packet, parent)
  end
  -- Dissect Options Directory Message
  if code == "D" then
    return dissect.options_directory_message(buffer, offset, packet, parent)
  end
  -- Dissect Complex Order Strategy Message
  if code == "R" then
    return dissect.complex_order_strategy_message(buffer, offset, packet, parent)
  end
  -- Dissect Security Trading Action Message
  if code == "H" then
    return dissect.security_trading_action_message(buffer, offset, packet, parent)
  end
  -- Dissect Complex Trading Action Message
  if code == "I" then
    return dissect.complex_trading_action_message(buffer, offset, packet, parent)
  end
  -- Dissect Security Open Closed Message
  if code == "P" then
    return dissect.security_open_closed_message(buffer, offset, packet, parent)
  end
  -- Dissect Strategy Open Closed Message
  if code == "Q" then
    return dissect.strategy_open_closed_message(buffer, offset, packet, parent)
  end
  -- Dissect Simple Order Message
  if code == "O" then
    return dissect.simple_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Complex Order Message
  if code == "X" then
    return dissect.complex_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Auction Notification Message
  if code == "A" then
    return dissect.auction_notification_message(buffer, offset, packet, parent)
  end
  -- Dissect Complex Auction Notification Message
  if code == "C" then
    return dissect.complex_auction_notification_message(buffer, offset, packet, parent)
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
  local element = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.payload, range, display)

  return dissect.payload_branches(buffer, offset, packet, parent, code)
end

-- Size: Message Type
size_of.message_type = 1

-- Display: Message Type
display.message_type = function(value)
  if value == "S" then
    return "Message Type: System Event Message (S)"
  end
  if value == "D" then
    return "Message Type: Options Directory Message (D)"
  end
  if value == "R" then
    return "Message Type: Complex Order Strategy Message (R)"
  end
  if value == "H" then
    return "Message Type: Security Trading Action Message (H)"
  end
  if value == "I" then
    return "Message Type: Complex Trading Action Message (I)"
  end
  if value == "P" then
    return "Message Type: Security Open Closed Message (P)"
  end
  if value == "Q" then
    return "Message Type: Strategy Open Closed Message (Q)"
  end
  if value == "O" then
    return "Message Type: Simple Order Message (O)"
  end
  if value == "X" then
    return "Message Type: Complex Order Message (X)"
  end
  if value == "A" then
    return "Message Type: Auction Notification Message (A)"
  end
  if value == "C" then
    return "Message Type: Complex Auction Notification Message (C)"
  end

  return "Message Type: Unknown("..value..")"
end

-- Dissect: Message Type
dissect.message_type = function(buffer, offset, packet, parent)
  local length = 1
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.message_type(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.message_type, range, value, display)

  return offset + length, value
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

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.length, range, value, display)

  return offset + size_of.length
end

-- Display: Message Header
display.message_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message Header
dissect.message_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Length: 2 Byte Unsigned Fixed Width Integer
  index = dissect.length(buffer, index, packet, parent)

  -- Message Type: 1 Byte Ascii String Enum with 11 values
  index = dissect.message_type(buffer, index, packet, parent)

  return index
end

-- Dissect: Message Header
dissect.message_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.message_header then
    local range = buffer(offset, 3)
    local display = display.message_header(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.message_header, range, display)
  end

  return dissect.message_header_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size: Message
size_of.message = function(buffer, offset)
  local index = 0

  index = index + 3

  -- Calculate runtime size of Payload field
  local payload_offset = offset + index
  local payload_type = buffer(payload_offset - 1, 1):string()
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

  -- Payload: Runtime Type with 11 branches
  local code = buffer(index - 1, 1):string()
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
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.message, range, display)
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
  local value = range:le_uint()
  local display = display.count(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.count, range, value, display)

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

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.sequence, range, value, display)

  return offset + size_of.sequence
end

-- Size: Session
size_of.session = 10

-- Display: Session
display.session = function(value)
  return "Session: "..value
end

-- Dissect: Session
dissect.session = function(buffer, offset, packet, parent)
  local range = buffer(offset, size_of.session)
  local value = range:string()
  local display = display.session(value, buffer, offset, packet, parent)

  parent:add(nasdaq_phlx_orders_itch_v1_9.fields.session, range, value, display)

  return offset + size_of.session
end

-- Display: Packet Header
display.packet_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Packet Header
dissect.packet_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Session: 10 Byte Ascii String
  index = dissect.session(buffer, index, packet, parent)

  -- Sequence: 4 Byte Unsigned Fixed Width Integer
  index = dissect.sequence(buffer, index, packet, parent)

  -- Count: 2 Byte Unsigned Fixed Width Integer
  index = dissect.count(buffer, index, packet, parent)

  return index
end

-- Dissect: Packet Header
dissect.packet_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.packet_header then
    local range = buffer(offset, 16)
    local display = display.packet_header(buffer, packet, parent)
    parent = parent:add(nasdaq_phlx_orders_itch_v1_9.fields.packet_header, range, display)
  end

  return dissect.packet_header_fields(buffer, offset, packet, parent)
end

-- Dissect Packet
dissect.packet = function(buffer, packet, parent)
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
function nasdaq_phlx_orders_itch_v1_9.init()
end

-- Dissector for Nasdaq Phlx Orders Itch 1.9
function nasdaq_phlx_orders_itch_v1_9.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = nasdaq_phlx_orders_itch_v1_9.name

  -- Dissect protocol
  local protocol = parent:add(nasdaq_phlx_orders_itch_v1_9, buffer(), nasdaq_phlx_orders_itch_v1_9.description, "("..buffer:len().." Bytes)")
  local protocol_size = dissect.packet(buffer, packet, protocol)
end

-- Register With Udp Table
local udp_table = DissectorTable.get("udp.port")
udp_table:add(65333, nasdaq_phlx_orders_itch_v1_9)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.nasdaq_phlx_orders_itch_v1_9_packet_size = function(buffer)

  return true
end

-- Dissector Heuristic for Nasdaq Phlx Orders Itch 1.9
local function nasdaq_phlx_orders_itch_v1_9_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.nasdaq_phlx_orders_itch_v1_9_packet_size(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = nasdaq_phlx_orders_itch_v1_9
  nasdaq_phlx_orders_itch_v1_9.dissector(buffer, packet, parent)

  return true
end

-- Register Nasdaq Phlx Orders Itch 1.9 Heuristic
nasdaq_phlx_orders_itch_v1_9:register_heuristic("udp", nasdaq_phlx_orders_itch_v1_9_heuristic)

-----------------------------------------------------------------------
-- This script was generated by the open markets initiative
-- Lua dissectors are an easily edited and modified cross platform dissection solution.
-- Feel free to modify. Enjoy.
-----------------------------------------------------------------------
-- Protocol:
-- Version: 1.9
-- Date: Monday, August 10, 2015
-- Script:
-- Source Version: 1.5.0.0
-- Compiler Version: 1.1
-- License: Public/GPLv3
-- Authors: Omi Developers
-----------------------------------------------------------------------
