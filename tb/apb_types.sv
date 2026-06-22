`ifndef APB_TYPES_SV
    `define APB_TYPES_SV

typedef virtual apb_if apb_vif;

typedef enum bit {APB_READ = 0, APB_WRITE = 1} apb_rw_t;

typedef bit [`APB_ADDR_WIDTH-1:0] apb_addr_t;
typedef bit [`APB_DATA_WIDTH-1:0] apb_data_t;

typedef enum bit {OKAY = 0, ERR = 1} apb_response_t;


`endif