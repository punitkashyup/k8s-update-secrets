require('dotenv').config();
const k8s = require('@kubernetes/client-node');

async function updateSecretValue() {
  try {
    const kc = new k8s.KubeConfig();
    kc.loadFromDefault();

    const k8sApi = kc.makeApiClient(k8s.CoreV1Api);

    const namespace = process.env.INPUT_NAMESPACE;
    const secretName = process.env.INPUT_SECRET_NAME;
    const key = process.env.INPUT_KEY;
    const newValue = process.env.INPUT_NEW_VALUE;
    const { body: secret } = await k8sApi.readNamespacedSecret(secretName, namespace);

    secret.data[key] = Buffer.from(newValue).toString('base64');

    await k8sApi.replaceNamespacedSecret(secretName, namespace, secret);

    console.log(`Value of ${key} in secret ${secretName} updated`);
  } catch (err) {
    console.error('Error updating secret:', err);
    process.exit(1); // Terminate with error status
  }
}

updateSecretValue();
