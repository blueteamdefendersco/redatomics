#! /bin/bash
  
# T1562.004 - Impair Defenses: Disable or Modify System Firewall

function a() {
    # Test 7 - Stop/Start UFW firewall
    # Test 8 - Stop/Start UFW firewall systemctl
    # Test 9 - Turn off UFW logging
    # Test 10 - Add and delete UFW firewall rules
    # Test 15 - Tail the UFW firewall log file
    # Test 16 - Disable iptables
    # Test 17 - Modify/delete iptables firewall rules
    if [ ! -x "$(command -v systemctl)" ]; then echo -e "\n***** systemctl NOT installed *****\n"; exit 1; fi
    if [ ! -x "$(command -v ufw)" ]; then echo -e "\n***** ufw NOT installed *****\n"; exit 1; fi
    if echo "$(sudo ufw status)" |grep -q "Status: active"; 
    then echo -e "\n***** ufw active *****\n"; 
        sleep 5;
        echo $(sudo ufw disable);
        sleep 5;
        echo $(sudo ufw enable);
        echo $(sudo ufw status verbose);
        sleep 5;
        echo $(sudo systemctl stop ufw);
        sleep 5;
        echo $(sudo systemctl start ufw);
        echo $(sudo systemctl status ufw);
        sleep 5;
        echo $(sudo ufw logging off);
        sleep 5;
        echo $(sudo ufw logging low);
        echo $(sudo ufw status verbose);
        sleep 5;
        echo $(sudo ufw prepend deny from 1.2.3.4);
        echo $(sudo ufw status numbered);
        sleep 5;
        echo $({ echo y; echo response; } | sudo ufw delete 1);
        echo $(sudo ufw status numbered);
        sleep 5;
        echo $(sudo tail /var/log/ufw.log);
        sleep 5;
        exit 1; 
    elif echo "$(sudo iptables -S| head -1)" |grep -q "P INPUT ACCEPT"; 
    then echo -e "\n***** iptables is configured *****\n"; 
        sleep 5; 
        echo "$(sudo iptables-save > /tmp/iptables.rules)"; 
        sleep 5; 
        echo "$(sudo iptables -F)"; 
        sleep 5; 
        echo "$(sudo iptables-restore < /tmp/iptables.rules)"; 
        sleep 5; 
        echo "$(sudo iptables -A OUTPUT -p tcp --dport 21 -j DROP)"; 
        sleep 5; 
        echo "$(sudo iptables-restore < /tmp/iptables.rules)"; 
        echo $(id); 
        exit 1; 
        fi
}

a

