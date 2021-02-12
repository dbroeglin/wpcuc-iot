import json
import logging
import os
import subprocess
import time

READ_MODBUS_PATH = os.getenv('READ_MODBUS_PATH', '/home/pirate/Sources/heizung/bin/readModbus')
SERIAL_DEVICE_PATH = os.getenv('SERIAL_DEVICE_PATH', '/dev/ttyAMA0')
LOG_FILE = os.getenv('LOG_FILE', '/var/log/wpcuc-collector.log')
DEBUG = os.getenv('DEBUG', 'no')
JSON_FILE = os.getenv('JSON_FILE', '/var/run/wpcuc.json')

LOG_FORMAT = '%(asctime)-15s %(levelname)-5s %(message)s'

fh = logging.FileHandler(LOG_FILE)
fh.setFormatter(logging.Formatter(LOG_FORMAT))

logger = logging.getLogger('collector')
logger.addHandler(fh)

if (DEBUG == 'yes'):
    logger.setLevel(logging.DEBUG)
    fh.setLevel(logging.DEBUG)
else:
    logger.setLevel(logging.INFO)
    fh.setLevel(logging.INFO)

def create_cmd(function, addr, size, datatype):
    return [READ_MODBUS_PATH,
            "-d%s" % SERIAL_DEVICE_PATH,
            "-f%d" % function, 
            "-a%s" % hex(addr), 
            "-s%d" % size, 
            "-t%d" % datatype]

def parse_value(datatype, str_value):
    if (datatype == 1): # Float
        return float(str_value)
    elif (datatype == 2 or datatype == 5 or datatype == 8): # datetime, time, string
        return str_value
    elif (datatype == 3 or datatype == 6): # int, byte
        return int(str_value)
    else:
        raise "Unable to convert datatype %d for value '%s'" % (datatype, str_value)
        


def read_value(collected_values, **kwargs):
    max_runs = 10 
    run = 1
    name = kwargs["name"]
    del kwargs["name"]
    while run <= max_runs:
        try:
            p = subprocess.run(
                    create_cmd(**kwargs),
                    stdout=subprocess.PIPE,
                    stderr=subprocess.PIPE,
                    encoding='cp850',
                    text=True,
                    timeout=2)
            if (p.returncode == 0):
                value = parse_value(kwargs['datatype'], p.stdout.strip())
                logger.info("%s = %s (attempt %d)" % (name, value, run))
                collected_values[name] = value
                break
            else:
                logger.debug("Attempt %d, Stdout: %s, Stderr: %s", run, p.stdout, p.stderr)
        except subprocess.TimeoutExpired:
            logger.exception("Timeout exception")
            continue
        except subprocess.SubprocessError:
            logger.exception("Subprocess exception")
            continue
        finally:
            run += 1
            time.sleep(0.1)
    
    if (run == max_runs):
        log.warn("Unable to get '%s'" % name)

DATA_TYPES = {
        'Float':    1,
        'DateTime': 2,
        'Int':      3,
        'Bool':     4,
        'Time':     5,
        'Byte':     6,
        'Bits':     7,
        'String':   8
        }

data = [

        { 'name': 'RTCTime', 'function': 4, 'addr': 1, 'size': 13, 'datatype': DATA_TYPES['DateTime'] },
        { 'name': 'OutdoorTemp', 'function': 3, 'addr': 433, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'OutdoorTemp1h', 'function': 4, 'addr': 465, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'OutdoorTemp24h', 'function': 4, 'addr': 497, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'ReturnTempNominal', 'function': 4, 'addr': 529, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'ReturnTemp', 'function': 3, 'addr': 561, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'FlowTemp', 'function': 3, 'addr': 593, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'DomesticWaterTNominal', 'function': 4, 'addr': 625, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'DomesticWaterTemp', 'function': 3, 'addr': 657, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'HeatSourceIn', 'function': 3, 'addr': 753, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'HeatSourceOut', 'function': 3, 'addr': 785, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'EvaporationTemp', 'function': 3, 'addr': 817, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'CondensationTemp', 'function': 3, 'addr': 849, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'SuctionGasTemp', 'function': 3, 'addr': 881, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'EvaporationPress', 'function': 3, 'addr': 945, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'CondensationPress', 'function': 3, 'addr': 977, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'HeatCharacteristicSetPoint', 'function': 4, 'addr': 1057, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'HeatCharacteristicSetPointBaseTemp', 'function': 4, 'addr': 1089, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'HeatCharacteristicGradient', 'function': 4, 'addr': 1121, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'HeatCharacteristicLimit', 'function': 4, 'addr': 1153, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'HeatReturnTemp', 'function': 4, 'addr': 1185, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'HeatReturnTempNominal', 'function': 4, 'addr': 1217, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'HeatTempHyst', 'function': 4, 'addr': 1249, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'AuxilaryModeHeating', 'function': 4, 'addr': 1409, 'size': 1, 'datatype': DATA_TYPES['Byte'] },
        { 'name': 'DomesticWaterTempActual', 'function': 4, 'addr': 1777, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'DomesticWaterTempNominal', 'function': 4, 'addr': 1809, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'DomesticWaterTempHyst', 'function': 4, 'addr': 1841, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'AuxiliaryHeatMode', 'function': 4, 'addr': 2145, 'size': 1, 'datatype': DATA_TYPES['Byte'] },
        { 'name': 'OHCompressor1', 'function': 4, 'addr': 2193, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'OHHeatingCompressor', 'function': 4, 'addr': 2257, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'OHDomesticWaterCompressor', 'function': 4, 'addr': 2289, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'OHHeatingAuxilary', 'function': 4, 'addr': 2321, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'OHDomesticWaterAuxilary', 'function': 4, 'addr': 2353, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'FailureTempFlow', 'function': 4, 'addr': 3345, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'FailureTempHeatSourceIn', 'function': 4, 'addr': 3377, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'FailureTempHeatSourceOut', 'function': 4, 'addr': 3409, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'FailureTempSuctionGas', 'function': 4, 'addr': 3441, 'size': 2, 'datatype': DATA_TYPES['Float'] },
        { 'name': 'HeatSourceMinT', 'function': 4, 'addr': 4097, 'size': 1, 'datatype': DATA_TYPES['Byte'] },

        ]

collected_values = {
        "time": time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime())
        }
for val in data:
    read_value(collected_values, **val)

with open(JSON_FILE, 'w') as json_file:
    json.dump(collected_values, json_file)


