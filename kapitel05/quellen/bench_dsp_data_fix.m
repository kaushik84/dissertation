%% Results are valid with a burst length of 510

%% RX PHY
rx_phy_label = {'Freq Sync';'Frame Sync'};
rx_phy_values = [191, 135];

%% RX TCH
rx_tch_label = {'Descrambler';'De-Interleaver';'Viterbi'};
rx_tch_values = [12,20,1409];

%% RX AACH
rx_aach_label = {'Descrambler';'Syndrom Decoder'};
rx_aach_values = [0.5, 21];

%% TX TCH
tx_tch_label = {'RCPC';'Interleaver';'Scrambler'};
tx_tch_values = [207, 27, 12];

%% TX AACH
tx_aach_label = {'Reed Muller';'Scrambler'};
tx_aach_values = [49.8, 0.5];


%% Transmitter
tx_label = {'MAC TCH';'MAC AACH';'PHY'};
tx_values = [sum(tx_tch_values),sum(tx_aach_values),87];

%% Receiver
rx_label = {'PHY';'MAC TCH';'MAC AACH'};
rx_values = [sum(rx_phy_values),sum(rx_tch_values),sum(rx_aach_values)];

%% Transceiver
trx_label = {'Transceiver';'Transmitter';'Receiver'};
trx_values = [sum(tx_values)+sum(rx_values),sum(tx_values),sum(rx_values)];

%% System Time
rel = sum(tx_values)+sum(rx_values);

