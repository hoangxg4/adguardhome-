# Sử dụng image chính thức của AdGuardHome
FROM adguard/adguardhome:latest

# Thiết lập thư mục làm việc
WORKDIR /opt/adguardhome

# Sao chép tệp cấu hình mặc định
COPY ./data /opt/adguardhome/data

# Phơi các cổng cần thiết
EXPOSE 53/tcp
EXPOSE 53/udp
EXPOSE 67/udp
EXPOSE 68/udp
EXPOSE 80
EXPOSE 443
EXPOSE 3000

# Khởi động AdGuardHome
CMD ["/opt/adguardhome/AdGuardHome", "-c", "/opt/adguardhome/data/AdGuardHome.yaml"]
