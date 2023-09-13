import fetch from "node-fetch";

const generateLocalTrackingId = () => {
  const trackingId = Math.floor(Math.random() * 1000000000);

  return `${trackingId}`;
}

export const generateTrackingId = async () => {
  try {
    const trackingIdResponse = await fetch('https://www.random.org/integers/?num=1&min=100000000&max=110000000&col=1&base=10&format=plain&rnd=new');
    if (trackingIdResponse.status !== 200) return generateLocalTrackingId()

    return generateLocalTrackingId();
  } catch (error) {
    throw error;
  }
};
