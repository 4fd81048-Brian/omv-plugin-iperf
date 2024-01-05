<?php
/**
 *
 */
namespace Engined\Rpc;

require_once("openmediavault/functions.inc");

class OMVRpcServiceiPerf3 extends \OMV\Rpc\ServiceAbstract {
        public function getName() {
                return "iPerf3";
        }

        public function initialize() {
                $this->registerMethod("get");
                $this->registerMethod("set");
        }

        function get($params, $context) {
                return \OMV\Rpc\Rpc::call("Config", "get", [
                        "id" => "conf.service.iperf3"
                ], $context);
        }

        function set($params, $context) {
                $this->validateMethodContext($context, [
                        "role" => OMV_ROLE_ADMINISTRATOR
                ]);
                return \OMV\Rpc\Rpc::call("Config", "set", [
                        "id" => "conf.service.iperf3",
                        "data" => $params
                ], $context);
        }
}
