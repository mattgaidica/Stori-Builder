from grakn.client import GraknClient

with GraknClient(uri="localhost:48555") as client:
	keyspaces = client.keyspaces().retrieve()
	if 'stori' in keyspaces:
		client.keyspaces().delete("stori")

	with client.session(keyspace="stori") as session:
        ## session is open
		pass
		print('Grakn initialized...')
    # session is closed
# client is closed