# Sử dụng hình ảnh Linux Alpine để giảm kích thước
FROM alpine:latest

# Cài đặt AdGuard Home
RUN wget -O /tmp/AdGuardHome_linux_amd64.tar.gz https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz && \
    tar -xzf /tmp/AdGuardHome_linux_amd64.tar.gz -C /tmp/ && \
    mv /tmp/AdGuardHome /opt/ && \
    rm -rf /tmp/*

# Di chuyển vào thư mục cài đặt AdGuard Home
WORKDIR /opt/AdGuardHome

# Sao chép tệp cấu hình mặc định nếu cần
COPY AdGuardHome.yaml /opt/AdGuardHome/

# Mở cổng để truy cập vào giao diện web
EXPOSE 53 53/udp 67/udp 68/udp 80 443

# Chạy AdGuard Home
CMD ["/opt/AdGuardHome/AdGuardHome", "-c", "/opt/AdGuardHome/AdGuardHome.yaml"]
