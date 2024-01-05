<?php
/**
 */
namespace Engined\Module;

class iPerf3 extends \OMV\Engine\Module\ServiceAbstract
                implements \OMV\Engine\Notify\IListener, \OMV\Engine\Module\IServiceStatus {
        public function getName() {
                return "iperf3";
        }

        public function deployAfter(): array {
                return ["hostname", "systemd-networkd"];
        }

        public function getStatus() {
                $db = \OMV\Config\Database::getInstance();
                $object = $db->get("conf.service.iperf3");
                $systemCtl = new \OMV\System\SystemCtl("container-wetty");
                return [
                        "name" => $this->getName(),
                        "title" => gettext("iPerf3"),
                        "enabled" => $object->get("enable"),
                        "running" => $systemCtl->isActive()
                ];
        }

        function bindListeners(\OMV\Engine\Notify\Dispatcher $dispatcher) {
                $dispatcher->addListener(
                        OMV_NOTIFY_MODIFY,
                        "org.openmediavault.conf.service.iperf3",
                        [$this, "setDirty"]);
        }
}
