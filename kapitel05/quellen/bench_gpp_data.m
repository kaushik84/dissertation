%% Results are valid with a burst length of 510

%% RX PHY
rx_phy_label = {'Time Sync';'Freq Sync';'Frame Sync'};
rx_phy_values = [51, 146, 171];

%% RX TCH
rx_tch_label = {'Descrambler';'De-Interleaver';'Viterbi'};
rx_tch_values = [7.5, 12.5, 388];

%% RX AACH
rx_aach_label = {'Descrambler';'Syndrom Decoder'};
rx_aach_values = [0.5, 10];

%% TX TCH
tx_tch_label = {'RCPC';'Interleaver';'Scrambler'};
tx_tch_values = [20, 5, 7.5];

%% TX AACH
tx_aach_label = {'Reed Muller';'Scrambler'};
tx_aach_values = [15, 0.5];


%% Transmitter
tx_label = {'MAC TCH';'MAC AACH';'PHY';'SRC'};
tx_values = [sum(tx_tch_values),sum(tx_aach_values),36,11.3];

%% Receiver
rx_label = {'SRC';'PHY';'MAC TCH';'MAC AACH'};
rx_values = [111, sum(rx_phy_values),sum(rx_tch_values),sum(rx_aach_values)];

%% Transceiver
trx_label = {'Transceiver';'Transmitter';'Receiver'};
trx_values = [sum(tx_values)+sum(rx_values),sum(tx_values),sum(rx_values)];

%% System Time
rel = sum(tx_values)+sum(rx_values);

