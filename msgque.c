#include<stdio.h>
#include<string.h>
#include<sys/msg.h>
#include<sys/ipc.h>

struct message
{
	long type;
	char text[100];
};

int main()
{
	int id;
	struct message msg;
	
	id=msgget(IPC_PRIVATE, 0666 | IPC_CREAT);
	if(id==-1)
	{
		perror("msgget");
		return 1;
	}
	msg.type=1;
	strcpy(msg.text, "Hello Linux");
  //fgets(msg.text,sizeof(msg.text),stdin);
	msgsnd(id, &msg, sizeof(msg.text), 0);
	printf("message sent: %s \n",msg.text);
	msgrcv(id,&msg,sizeof(msg.text),1,0);
	printf("Messaage recived %s\n",msg.text);
	msgctl(id,IPC_RMID,NULL);
	return 0;

}
