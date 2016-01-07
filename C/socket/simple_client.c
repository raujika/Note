#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <arpa/inet.h>

int main(int argc, char *argv[]) {
	int socket_desc;
	struct sockaddr_in server;
	char *message, server_reply[6000];

	socket_desc = socket(AF_INET, SOCK_STREAM, 0);
	if(socket_desc == -1) {
		printf("Could not create socket");
	}

	server.sin_addr.s_addr = inet_addr("131.253.13.140");
	server.sin_family = AF_INET;
	server.sin_port = htons(80);

	if(connect(socket_desc, (struct sockaddr *)&server, sizeof(server)) < 0){
		puts("connect error");
		return 1;
	}

	puts("Connected\n");

	message = "GET /?st=1 HTTP/1.1\r\nHost: www.msn.com\r\n\r\n";
	if(send(socket_desc, message, strlen(message), 0) < 0) {
		puts("Send failed");
		return 1;
	}
	puts("Data Send\n");

	if(recv(socket_desc, server_reply, 6000, 0) < 0) {
		puts("recv failed");
	}
	puts("Reply received\n");
	puts(server_reply);

	return 0;
}
